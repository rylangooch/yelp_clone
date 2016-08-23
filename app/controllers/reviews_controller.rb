class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end
<<<<<<< HEAD
  
=======

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.create(review_params)
    redirect_to '/restaurants'
  end

  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

>>>>>>> c38fd22d2e595f409b5b4e3f0c95db55657d489f
end
