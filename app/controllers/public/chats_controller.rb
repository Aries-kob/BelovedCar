class Public::ChatsController < ApplicationController
    
  def show
    @menber = Menber.find(params[:id])
    rooms = current_menber.chat_rooms.pluck(:room_id)
    @chat_rooms = ChatRoom.find_by(menber_id: @menber.id, room_id: rooms)
    
    if menber_rooms.nil?
      @room = Room.new
      @room.save
      ChatRoom.create(menber_id: @menber.id, room_id: @room.id)
      ChatRoom.create(menber_id: current_menber.id, room_id: @room.id)
    else
      @room = menber_rooms.room
    end
    
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end      
  
  def create
    @chat = current_menber.chats.new(chat_params)
    @chat.save
  end
  
  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end      
end
