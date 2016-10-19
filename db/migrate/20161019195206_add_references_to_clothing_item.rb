class AddReferencesToClothingItem < ActiveRecord::Migration
  def change
    add_reference :clothing_items, :wardrobe, index: true, foreign_key: true
    add_reference :clothing_items, :clothing_type, index: true, foreign_key: true
  end
end