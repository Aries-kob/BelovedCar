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
    
    
    private
    
    def car_image_type
      car_images.each do |car_image|
        if !car_image.blob.content_type.in?(%('image/jpeg image/png'))
          car_image.purge
          errors.add(:car_image, 'はjpegまたはpng形式でアップロードしてください')
        end
      end
    end
    
    def car_image_size
      car_images.each do |car_image|
        if car_image.blob.byte_size > 3.megabytes
          car_image.purge
          errors.add(:car_image, "は1つのファイル3MB以内にしてください")
        end
      end
    end  
    
end
