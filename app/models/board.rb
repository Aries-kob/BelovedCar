class Board < ApplicationRecord
  belongs_to :menber
  
  validates :title, presence: true, length: { maximum: 50 }
end
