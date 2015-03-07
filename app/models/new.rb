class New < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 55 }
  validates :content, presence: true
  validates :date_exp, presence: true
end
