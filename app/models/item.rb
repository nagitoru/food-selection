class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :item_allergies, dependent: :destroy
  has_many :allergies, through: :item_allergies
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :allergy_ids
  end
end
