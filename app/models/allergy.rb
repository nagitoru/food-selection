class Allergy < ApplicationRecord
  has_many :item_allergies
  has_many :items, through: :item_allergies
end
