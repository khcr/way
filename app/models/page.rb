class Page < ActiveRecord::Base
  attr_accessible :content, :title, :name, :ancestry, :parent_id

  has_ancestry

  validates :content, presence: true
  validates :title, presence: true
  validates :name, presence: true, uniqueness: true
end
