class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    @messages = Message.all
    verify_traded
  end

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

  def no_show
  end
end
