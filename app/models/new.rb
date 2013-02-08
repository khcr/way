class New < ActiveRecord::Base
  attr_accessible :content, :title, :date_exp


  validates :title, presence: true, length: { maximum: 15 }
  validates :content, presence: true
  validates :date_exp, presence: true
end
