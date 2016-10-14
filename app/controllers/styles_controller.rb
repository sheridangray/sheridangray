class StylesController < ApplicationController
  def show
    @style = Style.find(params[:id])
    
    items = []
    @style.ideal_wardrobe_items.each do |item|
      items << {name: item.clothing_type.name, amount: item.amount}
    end
    
    render json: {description: @style.description, items: items}
  end
end
