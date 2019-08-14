class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurants = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurants = Restaurant.find(params[:restaurant_id])
    @review = Review.new(reviews_params)
    @review.restaurant = @restaurants
    @review.save
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating, :restaurant)
  end
end
