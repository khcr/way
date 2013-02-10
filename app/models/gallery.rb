class Gallery < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :paintings

  validates :name, presence: true, length: { maximum: 15 }
end
