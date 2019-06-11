class Product < ApplicationRecord
  require 'open-uri'

  scope :search, ->q{where "name LIKE '%#{q}%'"}
  scope :order_by_name, ->{order name: :asc}

  #validates
  after_save :resize_images
  validates :name, presence: true, uniqueness: true, length: {maximum: 30,minimum: 5}
  validates :description, presence:true, length: {maximum: 150,minimum: 10}
  validates :price, :presence => {:message => 'Price is number'},:numericality => true
  validates :category_id, presence:true
  validates :images, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 3.megabytes , message: 'is not given between size ,maximum 3mb ' }
  #associate
  has_many :stocks, dependent: :destroy
  accepts_nested_attributes_for :stocks, allow_destroy: true, reject_if: :all_blank
  has_many_attached :images
  belongs_to :category, optional: true
  has_many :cart_products
  has_many :carts
  before_destroy :check_if_has_line_item
  has_many :comments
  belongs_to :brand, optional: true
  has_many :news_products
  has_many :news, through: :news_products



  private

  def resize_images
    # list_img = []
    # images.each do |img|
    #         filename = img.filename.to_s
    #         attachment_path = ActiveStorage::Blob.service.path_for(img.key)            
    #         image_resize = MiniMagick::Image.open(attachment_path)
    #          image_resize.resize "900x900"
    #         image_resize.write attachment_path
    #         a = Rack::Test::UploadedFile.new(attachment_path)
    #         list_img.push(a)
    # end
    #         self.images.destroy_all
    #         self.images.attach(list_img)
    #         delete_folder_empty
 end



   def delete_folder_empty
      Dir.glob(Rails.root.join('storage', '**', '*').to_s).sort_by(&:length).reverse.each do |x|
        if File.directory?(x) && Dir.empty?(x)
          Dir.rmdir(x)
        end
       end
  end

end
