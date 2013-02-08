class Page < ActiveRecord::Base
  attr_accessible :content, :title, :name

  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :name, presence: true, length: { maximum: 15 }
end
