class AddClothingTypeCategoryToClothingType < ActiveRecord::Migration
  def change
    add_reference :clothing_types, :clothing_type_category, index: true, foreign_key: true
  end
end
