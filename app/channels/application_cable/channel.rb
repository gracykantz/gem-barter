module ApplicationCable
  class Channel < ActionCable::Channel::Base
    stream_from "chatroom_#{params[:chatroom_id]}"
  end
end
