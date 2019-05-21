class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  # validate :content_type_avatar 
   # validates :phone, :presence => {:message => 'Phone errors'},
   #                   :numericality => true,
   #                   :length => { :minimum => 9, :maximum => 11 }
   validates :firstname , presence: true
   validates :lastname , presence: true
   validates :address , presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :payments
  has_many :carts
  has_many :comments
  has_many :notifications
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
   private

	   def content_type_avatar
	         if self.avatar.content_type != "image/png" && self.avatar.content_type != "image/jpeg" 
	         	 errors.add(:notice, "avatar file errors")
	           return false
	         end 
	    end 
end
