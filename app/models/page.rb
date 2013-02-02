class Page < ActiveRecord::Base
  attr_accessible :content, :title, :name

  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 10 }
  validates :name, presence: true, length: { maximum: 10 }, uniqueness: true
end
