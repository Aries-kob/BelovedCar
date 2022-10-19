class BoardComment < ApplicationRecord
  belongs_to :menber
  belongs_to :board
  
  validates :body, presence: true, length: {maximum: 100 }
  
end
