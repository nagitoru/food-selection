class CreateItemAllergies < ActiveRecord::Migration[6.0]
  def change
    create_table :item_allergies do |t|
      t.references :item,      foreign_key: true
      t.references :allergy, foreign_key: true
      t.timestamps
    end
  end
end
