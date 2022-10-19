class PostComment < ApplicationRecord
    belongs_to :menber
    belongs_to :post
    validates :comment, presence:true, length: {maximum: 100 }
end
