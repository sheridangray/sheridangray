class CreateClothingTypeCategories < ActiveRecord::Migration
  def change
    create_table :clothing_type_categories do |t|
      t.string :name
      t.text :description
      t.integer :sort_order

      t.timestamps null: false
    end
  end
end
