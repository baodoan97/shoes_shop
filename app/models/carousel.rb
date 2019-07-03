class Carousel < ApplicationRecord
  belongs_to :new, optional: true
  has_one_attached :image
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
    dimension: { width: { min: 1920, max: 1920 },
                 height: { min: 430, max: 430 }, message: 'is not given between dimension'
                  }
    # validates :new_id , uniqueness: true
  before_save :check_news
  after_save :check_main
  private
  def check_main
    if Carousel.all.where(main: true).length == 2 && self.main == true
      self.main = false
      self.save
      errors.add(:main, "was have carousel top")
      return false
    end
  end
  def check_news
      if New.exists?(:id => self.new_id.to_i) == false
        unless self.new_id == nil
          self.destroy 
          errors.add(:news, " id not exists")
          return false
        end
      end
  end
end
