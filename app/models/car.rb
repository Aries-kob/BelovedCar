class Car < ApplicationRecord
    has_one_attached :car_image
    has_many :car_genre_relations, dependent: :destroy
    has_many :genres, through: :car_genre_relations
    belongs_to :menber
    
    validates :car_image, presence: true
    validates :name, presence: true
    
    def get_car_image(width, height)
      car_image.variant(resize_to_limit: [width, height]).processed
    end  
    
end
