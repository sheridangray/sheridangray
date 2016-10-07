class ClothingTypeCategory < ActiveRecord::Base

  has_many :clothing_types

  validates_uniqueness_of :name
end
