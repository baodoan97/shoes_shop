class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable,:rememberable, :trackable, :timeoutable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,:confirmable
  has_many :messages
  # after_create :welcome_send
  # def welcome_send
  #   WelcomeMailer.welcome_send(self).deliver
  # end
end
