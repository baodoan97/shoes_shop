class NewsTypeForShoe < ApplicationRecord
	    	has_many :new
	    	enum status: [:closed, :archived,:active]
end 