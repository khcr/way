class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :level
  has_secure_password

  before_save :create_remember_token, :format

  validates :name, presence: true, length: { maximum: 15 }
  validates :password, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  private

  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end

  def format
    self.name = self.name.gsub(/\s+/, "").downcase
  end
end