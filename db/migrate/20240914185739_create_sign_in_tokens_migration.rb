class CreateSignInTokensMigration < ActiveRecord::Migration[7.2]
  def change
    create_table :sign_in_tokens do |t|
      t.references :user, null: false, foreign_key: true
    end
  end
end
