class CreateJobApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :job_applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job_listing, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.text :cover_letter

      t.timestamps
    end
  end
end
