class RestaurantsController < ApplicationController

  def index
<<<<<<< HEAD
    
  end
=======
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to '/restaurants'
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to '/restaurants'
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = 'Restaurant deleted successfully'
    redirect_to '/restaurants'
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

>>>>>>> c38fd22d2e595f409b5b4e3f0c95db55657d489f
end
