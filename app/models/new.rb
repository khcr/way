class New < ActiveRecord::Base
  attr_accessible :content, :title


  validates :title, presence: true, length: { maximum: 10 }
  validates :content, presence: true
end
