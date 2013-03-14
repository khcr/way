class Slideshow < ActiveRecord::Base
  attr_accessible :date_exp, :image, :link, :name

  mount_uploader :image, SlideshowUploader

  validates :date_exp, presence: true
  validates :image, presence: true
  validates :link, presence: true, length: { maximum: 55 }
  validates :name, presence: true, length: { maximum: 55 }
end
