class AddColumnSwords < ActiveRecord::Migration[6.1]
  def change
    add_column :swords , :role_id, :integer
  end
end
