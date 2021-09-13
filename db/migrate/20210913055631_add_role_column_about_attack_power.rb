class AddRoleColumnAboutAttackPower < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :power, :integer
    add_column :roles, :attack_power, :integer
    add_column :roles, :really_attack_power, :integer
  end
end
