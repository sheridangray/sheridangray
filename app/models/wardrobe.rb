class Wardrobe < ActiveRecord::Base
  belongs_to :style
  belongs_to :user
  has_many :clothing_items

  def items_needed clothing_type
    ideal_items = self.style.ideal_wardrobe_items.find_by(clothing_type: clothing_type).amount
    actual_items = self.clothing_items.where(clothing_type: clothing_type).count
    ideal_items - actual_items
  end
  
end
