class Form < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :phone, :notice

  validates :first_name, presence: true, length: { maximum: 55 }
  validates :last_name, presence: true, length: { maximum: 55 }
  validates :phone, presence: true, length: { maximum: 55 }
end
