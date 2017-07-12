class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name, :limit => 255, :null => false

      t.timestamps
    end
  end
end
