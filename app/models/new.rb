class New < ApplicationRecord
	has_many :news_products
    has_many :products, through: :news_products
end
