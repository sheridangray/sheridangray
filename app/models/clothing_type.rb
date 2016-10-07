class ClothingType < ActiveRecord::Base

  belongs_to :clothing_type_category
  has_many :ideal_wardrobe_items

  validates_uniqueness_of :name

end
