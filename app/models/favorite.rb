class Favorite < ApplicationRecord
    
    belongs_to :menber
    belongs_to :post
end
