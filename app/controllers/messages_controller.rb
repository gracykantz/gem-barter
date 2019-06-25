class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message.chat_room = @chat_room
    @message.user = current_user
    if @message.save!

      respond_to do |format|
        format.html { redirect_to chat_room_path(@chat_room) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "chat_rooms/show" }
        format.js
      end
    end
  end

  def show_history
    # @chat_room = ChatRoom.find_by("name LIKE ? %#{current_user.first_name}%")
    @chat_rooms = ChatRoom.includes(messages: :user).where('name LIKE ?', "%#{current_user.first_name}%")
    if @chat_rooms.first.present?

    end
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

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
