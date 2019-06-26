class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @chatroom = ChatRoom.find(params[:chat_room_id])
  end

  def create
    @review = Review.new(review_params)
    @user_reviewed = Message.where(["chat_room_id = ? and user_id <> ?", params[:chat_room_id],  current_user.id]).first
    @review.user_reviewed_id = @user_reviewed.id
    @review.user_reviewing_id = current_user.id
    redirect_to traded_path if @review.review.nil?
    if @review.save
      redirect_to traded_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:review)
  end
end
