class Style < ActiveRecord::Base
  
  has_many :ideal_wardrobe_items
  has_many :clothing_types, through: :ideal_wardrobe_items
  
  validates_uniqueness_of :name
end
