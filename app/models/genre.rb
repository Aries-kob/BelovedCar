class Genre < ApplicationRecord
    
    has_many :car_genre_relations
    has_many :cars, through: :car_genre_relations
end
