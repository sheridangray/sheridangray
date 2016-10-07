class AddImageUrlToClothingType < ActiveRecord::Migration
  def change
    add_column :clothing_types, :image_url, :string
  end
end
