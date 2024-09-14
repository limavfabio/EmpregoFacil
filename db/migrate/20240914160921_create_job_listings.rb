class CreateJobListings < ActiveRecord::Migration[7.2]
  def change
    create_table :job_listings do |t|
      t.string :title
      t.string :description
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
