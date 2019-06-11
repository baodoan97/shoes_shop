class New < ApplicationRecord
	has_many :news_products
    has_many :products, through: :news_products
    belongs_to :news_type_for_shoe, optional: true

    # validates :title, presence:true, length: {minimum: 100, maximum: 300}, uniqueness:true
    # validates :body, presence:true, length: { minimum: 100}, uniqueness:true

end
