class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :item_allergies
  has_many :allergies, through: :item_allergies

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :allergy_ids
  end
end
