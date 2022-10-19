class Post < ApplicationRecord
    has_one_attached :post_image
    belongs_to :menber
    has_many :favorites, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    
    validates :title, presence: true, length: { maximum: 40 }
    validates :introduction, presence: true, length: {maximum: 100 }
    validates :post_image, presence: true
    
    def favorited_by?(menber)
    favorites.exists?(menber_id: menber.id)
    end
    
    private
    
    def post_image_type
      post_images.each do |post_image|    
        if !post_image.blob.content_type.in?(%('image/jpeg image/png'))
          post_image.purge
          errors.add(:post_image, 'はjpegまたはpng形式でアップロードしてください')
        end
      end    
    end
    
    def post_image_size
      post_images.each do |post_image|
        if post_image.blob.byte_size > 3.megabytes
          post_image.purge
          errors.add(:post_image, "は1つのファイル3MB以内にしてください")
        end
      end
    end  
    
  
end
