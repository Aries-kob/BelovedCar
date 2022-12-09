class ChatRoom < ApplicationRecord
    belongs_to :menber
    belongs_to :room
end
