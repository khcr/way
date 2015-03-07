class Slideshow < ActiveRecord::Base
  mount_uploader :image, SlideshowUploader

  validates :date_exp, presence: true
  validates :link, presence: true, length: { maximum: 55 }
  validates :name, presence: true, length: { maximum: 55 }
end
