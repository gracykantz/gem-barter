class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @chatroom = ChatRoom.find(params[:chat_room_id])
  end

  def create
    verify_traded
    @review = Review.new(review_params)
    @user_reviewed = Message.where(["chat_room_id = ? and user_id <> ?", params[:chat_room_id],  current_user.id]).first

    redirect_to traded_path if @review.review.nil?
      @review.user_reviewed_id = @user_reviewed.id
      @review.user_reviewing_id = current_user.id
    if @review.save
      redirect_to traded_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def verify_traded
    furniture_item = FurnitureItem.find_by_user_id(current_user.id)
    if furniture_item.nil?
      @trade = 'a'
    elsif !furniture_item.matched_to_id.nil?
      @trade = 'e'
      @match = Match.find_by(id: furniture_item.matched_to_id)
      if @match.traded == true
        @trade = 't'
      elsif @match.present?
        @trade = 'm'
      end
    end
  end

  def review_params
    params.require(:review).permit(:review)
  end
end
