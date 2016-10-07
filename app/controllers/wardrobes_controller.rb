class WardrobesController < ApplicationController
  before_action :set_project, only: [:show, :edit, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]


  def index
    @wardrobe = Wardrobe.find_by(user_id: current_user)
    if @wardrobe
      redirect_to @wardrobe
    end
  end
    
  def new
    @wardrobe = Wardrobe.new
  end

  def create
    @wardrobe = Wardrobe.new(wardrobe_params)
    @wardrobe[:user_id] = current_user.id

    @wardrobe.style.ideal_wardrobe_items.each do |ideal_clothing_item|      
      ideal_clothing_item.amount.times do
        clothing_item = ClothingItem.create(
          wardrobe: @wardrobe,
          clothing_type_id: ideal_clothing_item.clothing_type_id
        )
      end
    end

    if @wardrobe.save
      redirect_to @wardrobe, notice: 'Project was successfully created.'
    else
      flash[:alert] = "There was a problem saving your wardrobe."
      render :new 
    end
  end

  def edit
  end

  def show
    @clothing_type_categories = ClothingTypeCategory.order(sort_order: :asc).all
  end

  def destroy
    @wardrobe.destroy
    redirect_to @wardrobe, notice: 'Got rid of your wardrobe for you.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @wardrobe = Wardrobe.find(params[:id])
  end

  def wardrobe_params
    params.require(:wardrobe).permit(:style_id, :annual_income, :family_size, :monthly_budget, :user_id)
  end

end