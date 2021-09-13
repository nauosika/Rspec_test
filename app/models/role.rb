class Role < ApplicationRecord
  has_one :skill

  belongs_to :user

  has_many :swords

  has_many :boxes
  has_many :items, through: :boxes

  validates :name , presence: true, length: { maximum: 10 }
  validates :job , presence: true, length: { minimum: 2 }
  validates :age , presence: true, numericality: { only_integer: true }

  before_update :attack_power, :really_attack_power

  def attack_power
    power * 10
  end

  def really_attack_power
    attack_power * sword_dps
  end

  # private
  def sword_dps
    @sword = self.swords.first
    @sword.dps
  end
end
