class BoardComment < ApplicationRecord
  belongs_to :menber
  belongs_to :board
  
end
