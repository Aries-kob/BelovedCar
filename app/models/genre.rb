class Genre < ApplicationRecord
    
    has_many :car_genres_relations
    has_many :cars, through: :car_genres_relations
end
