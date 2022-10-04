class CreateChatRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_rooms do |t|
      
      t.integer :menber_id, null: false
      t.integer :room_id, null: false

      t.timestamps
    end
  end
end
