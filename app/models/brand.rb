class Brand < ApplicationRecord
  validates :brand_name , presence: true
  validates :category_id , presence: true
  belongs_to :category
  has_many :products
  has_one_attached :image_main_brand
  has_one_attached :image_effect_brand
  enum status: [:closed, :archived,:active]
  validates :image_main_brand, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 1.5.megabytes , message: 'is not given between size ,maximum 1.5mb ' }
  validates :image_effect_brand, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 1.5.megabytes , message: 'is not given between size ,maximum 1.5mb ' }

  def self.resize_image_brand(image_brand)
    attachment_path = image_brand.path           
    image = MiniMagick::Image.open(attachment_path)
    image.resize "255x400"
    image.write attachment_path
    img_new = Rack::Test::UploadedFile.new(attachment_path)
    img_new
  end

end
