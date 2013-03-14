class Slideshow < ActiveRecord::Base
  attr_accessible :date_exp, :image, :link, :name

  mount_uploader :image, SlideshowUploader
end
