class Role < ApplicationRecord
  validates :name , presence: true, length: { maximum: 10 }
  validates :job , presence: true, length: { minimum: 2 }
  validates :age , presence: true, numericality: { only_integer: true }
end
