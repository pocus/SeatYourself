class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
        redirect_to restaurants_path
    else
        render :edit
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
        redirect_to restaurants_path
    else
        render :new
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:address, :timeopening, :timeclosing, :menu, :pricerange, :category, :totalseats, :description, :name )
  end

end
