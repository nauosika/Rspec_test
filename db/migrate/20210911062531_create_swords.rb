class CreateSwords < ActiveRecord::Migration[6.1]
  def change
    create_table :swords do |t|

      t.timestamps
    end
  end
end
