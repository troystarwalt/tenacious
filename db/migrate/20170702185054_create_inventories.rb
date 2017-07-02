class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.string :name, :limit => 255, :null => false
      t.string :description, :limit => 255
      t.timestamps
    end
  end
end
