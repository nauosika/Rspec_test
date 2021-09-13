class Sword < ApplicationRecord
  belongs_to :role

  def dps
    (min_damge + min_damge) / 2
  end
end
