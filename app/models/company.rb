class Company < ApplicationRecord
  has_many :job_listings

  validates :name, presence: true
end
