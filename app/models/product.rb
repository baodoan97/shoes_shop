class Product < ApplicationRecord

    scope :search, ->q{where "name LIKE '%#{q}%'"}
    scope :order_by_name, ->{order name: :asc}
    
	#associate
     #validates
     validates :name, presence: true, uniqueness: true, length: {maximum: 30,minimum: 5}
     validates :description, presence:true, length: {maximum: 150,minimum: 10}
    validates :price, :presence => {:message => 'Price is number'},:numericality => true
    validates :category_id, presence:true



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
     
   def content_type
            i = 0
        self.images.each{ |image|
             if image.content_type != "image/png" && image.content_type != "image/jpeg"
                self.images[i].destroy
                return
             end  
             i = i + 1
        }
       
    end 

    def check_if_has_line_item
        if cart_products.empty?
            return true
        else
            errors.add(:base, 'This product has a LineItem')
            return false
        end
    end
	
end