class AddColumnSwordMinMaxDamge < ActiveRecord::Migration[6.1]
  def change
    add_column :swords, :min_damge, :integer
    add_column :swords, :max_damge, :integer
  end
end
