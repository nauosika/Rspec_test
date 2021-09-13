class DropColumnRole < ActiveRecord::Migration[6.1]
  def change
    remove_column :roles, :sword_dps, :integer
  end
end
