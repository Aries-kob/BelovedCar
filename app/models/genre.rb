class Genre < ApplicationRecord
    
    has_many :car_genres
    has_many :cars, through: :genrs
end
