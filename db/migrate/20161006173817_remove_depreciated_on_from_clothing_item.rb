class RemoveDepreciatedOnFromClothingItem < ActiveRecord::Migration
  def change
    remove_column :clothing_items, :depreciate_on
    
  end
end
