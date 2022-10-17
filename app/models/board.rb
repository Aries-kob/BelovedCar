class Board < ApplicationRecord
  belongs_to :menber
  has_many :board_comments, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 50 }
end
