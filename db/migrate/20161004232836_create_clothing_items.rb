class CreateClothingItems < ActiveRecord::Migration
  def change
    create_table :clothing_items do |t|

      # t.references :wardrobe, index: true, foreign_key: true
      # t.references :clothing_type, index: true, foreign_key: true
      t.date :depreciate_on
      t.date :purchased_on

      t.timestamps null: false
    end
  end
end
