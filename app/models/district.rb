class District < ApplicationRecord
	belongs_to :province
	has_many :wards
end