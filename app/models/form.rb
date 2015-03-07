class Form < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 55 }
  validates :last_name, presence: true, length: { maximum: 55 }
  validates :phone, presence: true, length: { maximum: 55 }
end
