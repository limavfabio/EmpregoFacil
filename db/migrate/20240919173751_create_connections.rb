class CreateConnections < ActiveRecord::Migration[7.2]
  def change
    create_table :connections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :connected_user, null: false, foreign_key: { to_table: :users }
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
