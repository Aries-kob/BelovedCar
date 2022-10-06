class Car < ApplicationRecord
    has_one_attached :car_image
    has_many :car_genres, dependent: :destroy
    has_many :genres, through: :car_genres, dependent: :destroy
    
    validates :image, presence: true
    validates :name, presence: true
    
    
end
