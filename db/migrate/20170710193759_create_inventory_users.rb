class CreateInventoryUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_users do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :inventory, foreign_key: true, null: false
      t.integer :user_role, default: 0, null: false
    end
  end
end
