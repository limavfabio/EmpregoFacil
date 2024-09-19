class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job_listing

  # TODO: implement status enum
  # enum :status, [ :pending, :accepted, :rejected ]
end
