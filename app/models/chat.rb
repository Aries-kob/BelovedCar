class Chat < ApplicationRecord
    belongs_to :menber
    belongs_to :room
end
