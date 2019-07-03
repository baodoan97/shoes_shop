class New < ApplicationRecord
	has_many :news_products
    has_many :products, through: :news_products
    belongs_to :news_type_for_shoe, optional: true
    has_one :carousel
    enum status: [:closed, :archived,:active]


end
