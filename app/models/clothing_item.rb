class ClothingItem < ActiveRecord::Base

  attr_accessor :depreciates_on

  belongs_to :wardrobe
  belongs_to :clothing_type

  has_attached_file :image, 
                    styles: { medium: "300x300" }
                    # default_url: ActionController::Base.helpers.asset_path("default.png")
                    # storage: :s3,
                    # s3_credentials: {
                    #   access_key_id: ENV["AMAZON_ACCESS_KEY"], 
                    #   secret_access_key: ENV["AMAZON_SECRET_KEY"]
                    # },
                    # region: ENV["AWS_REGION"],
                    # bucket: "sheridangray-production"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  def depreciates_on
    (self.purchased_on + self.clothing_type.expected_months_to_expire.months).beginning_of_month
  end

  def status
    if depreciates_on < Date.today
      "Expired"
    else
      "Good"
    end
  end

  def items_needed_for_wardrobe 
    @clothing_item.wardrobe.style.ideal_wardrobe_items.where(clothing_type: @clothing_item.clothing_type)
  end

end
