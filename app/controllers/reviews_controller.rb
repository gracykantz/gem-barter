class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end

  def create
    verify_traded
    @chat_room = ChatRoom.find(params[:chat_room_id])


    @review = Review.new(review_params)
    @user_reviewed = Message.where(["chat_room_id = ? and user_id <> ?", params[:chat_room_id],  current_user.id]).first

    if @review.review.nil?
      mark_traded
      redirect_to myprofile_path
    else
      user1 = @match.swipes.first.wanted_furniture_item.user
      user2 = @match.swipes.first.owned_furniture_item.user
      reviewed_user = [user1, user2].find {|user| user != current_user}
      @review.user_reviewing_id = current_user.id
      @review.user_reviewed_id = reviewed_user.id
      if @review.save
        mark_traded
        redirect_to myprofile_path
      else
        flash[:alert] = "Something went wrong."
        render 'chat_rooms/show'
      end
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

def mark_traded
    # @furniture = FurnitureItem.find_by_user_id(current_user.id)
    @chat = ChatRoom.where('name LIKE ? AND status = ?', "%#{current_user.first_name}%", 'Open')
    @swipe = Swipe.find_by(match_id: @chat.first.match_id)
    if !@swipe.nil?
      @match = Match.find_by(id: @swipe.match_id)
      @match.update!(traded: true)
      @chat_room = ChatRoom.find_by(match_id: @match.id)
      @chat_room.update!(status: 'Closed')
    end
end
