class Menber < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_image
  has_many :cars, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :bords, dependent: :destroy
  has_many :board_comments, dependent: :destroy
  
  
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image
    profile_image.variant(resize_to_limit: [width, height]).processed
  end  
  
  def self.guest
    find_or_create_by!(name: 'guestmenber' ,email:'guest@example.com') do |menber|
      menber.password = SecureRandom.urlsafe_base64
      menber.name = "guestmenber"
      menber.nickname = "guest"
    end
  end  
         
  enum area:{
    未選択: 0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46, 
    沖縄県:47
  }
  
  private
  
  def profile_image_type
    profile_images.each do |profile_image|
      if profile_image.blob.content_type.in?(%('image/jpge image/png'))
        profile_image.purge
        errors.add(:profile_image, "はjpgeまたはpng形式でアップロードしてください")
      end
    end
  end
  
  def profile_image_size
    profile_images.each do |profile_image|
      if profile_image.blob.byte_size > 3.megabytes
        profile_image.purge
        errors.add(:profile_image, "は1つのファイル3MB以内にしてください")
      end
    end
  end  
  
end
