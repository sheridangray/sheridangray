class IdealWardrobeItem < ActiveRecord::Base

  belongs_to :style
  belongs_to :clothing_type

end
