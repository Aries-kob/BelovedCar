class CarGenre < ApplicationRecord
    
    belong_to :car
    belong_to :genre
end
