class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.build(review_params)
    @reviews = Review.where("user_id = ?", params[:product_id])

    if @review.save
      redirect_to user_path(@review.user) # review_path(@review)
    end
  end

  private

  def review_params
    params.require(:review).permit(:review, :user_id)
  end
end
