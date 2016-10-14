class StaticPagesController < ApplicationController

  def home
    render layout: 'cover'
  end

  def about
    render layout: 'application'
  end

end
