class ChangeUsers < ActiveRecord::Migration[7.2]
  def change
    change_table :users do |t|
      t.string :name, null: false
      t.string :phone_number
    end
  end
end
