json.extract! job_application, :id, :user_id, :job_listing_id, :status, :cover_letter, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)
