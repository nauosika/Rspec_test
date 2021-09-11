class Item < ApplicationRecord
  has_many :boxes
  has_many :roles, through: :boxes
end
