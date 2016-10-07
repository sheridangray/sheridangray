class ClothingItemsController < ApplicationController
  before_action :set_clothing_item, only: [:edit, :update, :destroy]

  # GET /clothing_items/new
  def new
    @clothing_item = ClothingItem.new
  end

  # GET /clothing_items/1/edit
  def edit
  end

  # POST /clothing_items
  def create
    @clothing_item.user = current_user
    @clothing_item = ClothingItem.new(clothing_item_params)

    respond_to do |format|
      if @clothing_item.save
        redirect_to @clothing_item, notice: 'Clothing item was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /clothing_items/1
  def update
    if @clothing_item.update(clothing_item_params)
      redirect_to wardrobe_path(@clothing_item.wardrobe_id), notice: 'Clothing item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clothing_items/1
  def destroy
    @clothing_item.destroy
    refill_ideal_clothing_items
    redirect_to wardrobe_path(@clothing_item.wardrobe_id), notice: 'Clothing item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothing_item
      @clothing_item = ClothingItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clothing_item_params
      params.require(:clothing_item).permit(:image, :purchased_on)
    end

    def refill_ideal_clothing_items
      @clothing_item.wardrobe.items_needed(@clothing_item.clothing_type).times do
        new_item = ClothingItem.new
        new_item.clothing_type = @clothing_item.clothing_type
        new_item.wardrobe = @clothing_item.wardrobe
        new_item.save
      end
    end
end