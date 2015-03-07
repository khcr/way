class Project < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 15 }, uniqueness: true
  validates :content, presence: true

  def to_param
  	"#{id}-#{name}" 
	end

end
