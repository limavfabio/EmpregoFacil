class CreateRecommendations < ActiveRecord::Migration[7.2]
  def change
    create_table :recommendations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recommender, null: false, foreign_key: { to_table: :users }
      t.text :content

      t.timestamps
    end
  end
end
