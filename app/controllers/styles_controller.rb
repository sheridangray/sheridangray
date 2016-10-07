class StylesController < ApplicationController
  def show
    @style = Style.find(params[:id])
    render json: @style
  end
end
