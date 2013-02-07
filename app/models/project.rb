class Project < ActiveRecord::Base
  attr_accessible :name, :content

  validates :name, presence: true, length: { maximum: 10 }
  validates :content, presence: true
end