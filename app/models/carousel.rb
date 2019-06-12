class Carousel < ApplicationRecord
  belongs_to :new, optional: true
  has_one_attached :image
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
    dimension: { width: { min: 1920, max: 1920 },
                 height: { min: 430, max: 430 }, message: 'is not given between dimension' }
    validates :new_id, :presence => {:message => 'News has already been taken'} , uniqueness: true
  before_save :check_main,:check_news
  private
  def check_main
    if Carousel.all.where(main: true).length == 1 && self.main == true
      self.destroy
      errors.add(:main, "was have carousel top")
      return false
    end
  end

  def check_news
    begin
      if New.find(self.new_id.to_i) == nil
        self.destroy
        errors.add(:news, " id not exists")
        return false
      end
    rescue Exception => e
      self.destroy
      errors.add(:news, " id not exists")
      return false
    end
  end
end
