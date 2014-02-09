class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all 
  end

  def edit
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
  end
end
