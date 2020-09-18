class Item < ApplicationRecord
  belongs_to :user
  has_many :item_allergies
  has_many :allergies, through: :item_allergies
end
