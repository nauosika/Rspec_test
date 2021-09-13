class AddColumnFoRoles < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :sword_dps, :integer
  end
end
