class AddPaperclipToClothingItem < ActiveRecord::Migration
  def change
    add_attachment :clothing_items, :image
  end
end
