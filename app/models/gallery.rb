class Gallery < ActiveRecord::Base
  has_many :paintings, :dependent => :destroy 

  validates :name, presence: true, length: { maximum: 55 }
  validates :date, presence: true
	
	def to_param
  	"#{id}-#{name}"
	end
end
