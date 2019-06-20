class User < ApplicationRecord
  require 'open-uri'
  enum status: [:closed, :archived,:active]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validate :content_type_avatar,on: :create
  has_one_attached :avatar
  validates :phone, :presence => {:message => 'Empty phone'},
    numericality: { only_integer: true },
    :length => { :minimum => 9, :maximum => 11 }#, uniqueness: true, unless: -> { phone = 0000000000 }
  validates :firstname , presence: true, format: {with: /[a-zA-Z]/}
  validates :lastname , presence: true, format: {with: /[a-zA-Z]/}
  validates :address , presence: true

  validates :avatar, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 1.5.megabytes , message: 'is not given between size ,maximum 1.5mb ' }



  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,:confirmable,:omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  has_many :messages,:dependent => :destroy
  has_many :payments
  has_many :carts,:dependent => :destroy
  has_many :comments,:dependent => :destroy
  has_many :notifications,:dependent => :destroy
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  # validates_format_of :password, :with =>  /(?=.*[!-=])(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/  , :message => "must have least one special character, must have least one number and must have least one capital character."

  def self.resize_avatar(avatar)
    attachment_path = avatar.path           
    image = MiniMagick::Image.open(attachment_path)
    image.resize "160x160"
    image.write attachment_path
    img_new = Rack::Test::UploadedFile.new(attachment_path)
    img_new
  end

  def delete_folder_empty
      Dir.glob(Rails.root.join('storage', '**', '*').to_s).sort_by(&:length).reverse.each do |x|
        if File.directory?(x) && Dir.empty?(x)
          Dir.rmdir(x)
        end
       end
  end

  # after_create :content_type_avatar
  # def welcome_send
  #   WelcomeMailer.welcome_send(self).deliver
  # end


  # def find_user_confirmable
  #   User.all.map do | user |
  #     if user.confirmed? == false
  #       user.destroy
  #     end
  #   end
  # end
  #login App 3rd part
  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.facebook_data"] &&
        session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth auth
    a = User.find_by_email(auth.info.email.to_s)
    if a != nil && a.provider == auth.provider.to_s
       return a
    else  
      # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user = User.create
        user.email = auth.info.email.to_s
        user.password ="Cxx"+Devise.friendly_token[0,20]+"9@"
        user.avatar.attach(User.avatar_file(auth.info.image))
        user.lastname = auth.info.name
        user.provider = auth.provider.to_s
        user.uid = auth.uid
        user.firstname = "user_user_id_"+"#{user.id}"
        user.phone = "0000000000"
        user.address = "Update address,Beacause it is form #{auth.provider}! Thank"
        user.skip_confirmation!
        user.confirm
        user.save
        return user
      # end
   end
        return nil
  end

  def self.avatar_file(url_for)
      download = open(url_for.to_s)
      IO.copy_stream(download, Rails.root.join("public/avatar.png"))
      file = Rack::Test::UploadedFile.new(Rails.root.join("public/avatar.png"))
      FileUtils.rm_f(Rails.root.join(Rails.root.join("public/avatar.png")))
      file
  end



  # private

  #  def content_type_avatar
  #        if self.avatar.attached? == false
  #          errors.add(:avatar, "is empty")
  #          return false
  #        end
  #        if self.avatar.content_type != "image/png" && self.avatar.content_type != "image/jpeg"
  #          self.destroy
  #          errors.add(:avatar, "type is errors")
  #          return false
  #        end
  #        self.avatar.variant(resize_to_fit: [ 100, 100 ])
  #   end
end
