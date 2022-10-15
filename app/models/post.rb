class Post < ApplicationRecord
    has_one_attached :post_image
    belongs_to :menber
    has_many :favorites, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    
    def favorited_by?(menber)
    favorites.exists?(menber_id: menber.id)
    end
    
  
end
