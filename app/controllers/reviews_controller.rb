class ReviewsController < ApplicationController
   before_action :authenticate_user!, only: [:new, :edit, :destroy, :update]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(
      restaurant_id: params[:restaurant_id],
      user_id: current_user.id,
      body: review_params["body"],
      score: review_params["score"]
    )
    if @review.save
      redirect_to restaurant_url(@review.restaurant)
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to restaurant_url(@review.restaurant)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_url(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(
      :body,
      :score
      )
  end

end
