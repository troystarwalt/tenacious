class AddOwnerIdToOrganization < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :owner_id, :integer, null: false
  end
end
