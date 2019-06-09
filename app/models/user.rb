class User < ApplicationRecord
  require 'open-uri'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validate :content_type_avatar,on: :create
  before_save :resize_avatar_image
  has_one_attached :avatar
  validates :phone, :presence => {:message => 'Empty phone'},
    numericality: { only_integer: true },
    :length => { :minimum => 9, :maximum => 11 }, uniqueness: true
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

  def resize_avatar_image
    filename = avatar.filename.to_s
    # puts attachment_path = "#{Dir.tmpdir}/#{avatar.filename}"
    attachment_path = ActiveStorage::Blob.service.path_for(avatar.key)            
    # File.open(attachment_path, 'wb') do |file|
    #    file.write(avatar.download)
    #    file.close
    # end
    image = MiniMagick::Image.open(attachment_path)
    # if image.width ...
    image.resize "160x160"
    image.write attachment_path

    avatar.attach(io: File.open(attachment_path), filename: filename, content_type: "image/jpg")
    delete_folder_empty
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
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email.to_s
      user.password = Devise.friendly_token[0,20]
      user.avatar.attach(User.avatar_file(auth.info.image))
      user.lastname = auth.info.name
      user.firstname = "user_user_id_#{user.id}"
      user.phone = "0000000000"
      user.address = "Update address,Beacause it is form #{auth.provider}! Thank"
      user.skip_confirmation!
      user.confirm
      user.save
    end
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
