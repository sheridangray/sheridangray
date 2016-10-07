class CreateIdealWardrobeItem < ActiveRecord::Migration
  def change
    create_table :ideal_wardrobe_items do |t|
      t.integer :amount
      t.references :clothing_type, index: true, foreign_key: true
      t.references :style, index: true, foreign_key: true
    end
  end
end
