class Member < ActiveRecord::Base
  attr_accessible :adress, :email, :first_name, :last_name, :phone

  validates :adress, presence: true
  validates :email, presence: true, length: { maximum: 55 }
  validates :first_name, presence: true, length: { maximum: 55 }
  validates :last_name, presence: true, length: { maximum: 55 }
  validates :phone, presence: true, length: { maximum: 55 }
end
