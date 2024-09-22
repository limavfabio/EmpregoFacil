class User < ApplicationRecord
  has_secure_password

  before_validation :generate_username, on: :create

  generates_token_for :email_verification, expires_in: 2.days do
    email
  end
  generates_token_for :password_reset, expires_in: 20.minutes do
    password_salt.last(10)
  end

  has_one_attached :avatar

  has_many :posts
  has_many :likes

  has_many :sessions, dependent: :destroy
  has_many :sign_in_tokens, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9_]+\z/, message: "can only contain letters, numbers, and underscores" }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, allow_nil: true, length: { minimum: 8 }

  normalizes :email, with: -> { _1.strip.downcase }
  normalizes :username, with: -> { _1.strip.downcase }

  before_validation if: :email_changed?, on: :update do
    self.verified = false
  end

  after_update if: :password_digest_previously_changed? do
    sessions.where.not(id: Current.session).delete_all
  end

  private

  def generate_username
    base_username = normalize_name("#{name}").downcase.gsub(/\s+/, "_")
    self.username = base_username

    # Check for uniqueness and append a number if necessary
    count = 1
    while User.exists?(username: self.username)
      self.username = "#{base_username}#{count}"
      count += 1
    end
  end

  def normalize_name(name)
    # Remove unwanted characters and replace spaces with underscores
    name.gsub(/[^a-zA-Z0-9\s]/, "").strip
  end
end
