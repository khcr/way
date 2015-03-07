class User < ActiveRecord::Base
  has_secure_password

  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 15 }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  private

  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end
end