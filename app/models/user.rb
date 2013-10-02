class User < ActiveRecord::Base
  has_secure_password
  before_save { self.email = self.email.downcase }
  before_create :create_remember_token
  has_many :posts
  has_many :votes
  has_many :comments

  validates_uniqueness_of :email

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
private 
  
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end        
end
