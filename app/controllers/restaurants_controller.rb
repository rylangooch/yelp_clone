class RestaurantsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :restaurant_owner, :only => [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      redirect_to restaurants_path
    else
      render 'new'
    end
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

  def restaurant_owner
    @restaurant = Restaurant.find(params[:id])
    unless @restaurant.user_id == current_user.id
      flash[:notice] = 'Restaurant does not belong to this user'
      redirect_to '/restaurants'
    end
  end

end
