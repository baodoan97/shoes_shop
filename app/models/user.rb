class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :resize_avatar_image 
  has_one_attached :avatar
  validate :content_type_avatar,on: :create
  validates :phone, :presence => {:message => 'Empty phone'},
                    numericality: { only_integer: true },
                    :length => { :minimum => 9, :maximum => 11 }, uniqueness: true
  validates :firstname , presence: true, format: {with: /[a-zA-Z]/}
  validates :lastname , presence: true, format: {with: /[a-zA-Z]/}
  validates :address , presence: true

  validates :avatar, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                                     dimension: { width: {  max: 1000 },
                                                  height: {  max: 1000 }, message: 'is not given between dimension maximum 1000x1000  ' }, size: { less_than: 1.5.megabytes , message: 'is not given between size ,maximum 1.5mb ' }



  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,:confirmable
  has_many :messages,:dependent => :destroy
  has_many :payments
  has_many :carts
  has_many :comments
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
  private
   def content_type_avatar
         if self.avatar.attached? == false
           errors.add(:avatar, "is empty")
           return false
         end
         if self.avatar.content_type != "image/png" && self.avatar.content_type != "image/jpeg"
           self.destroy
           errors.add(:avatar, "type is errors")
           return false
         end
         self.avatar.variant(resize_to_fit: [ 100, 100 ])
    end
end
