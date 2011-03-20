class User < ActiveRecord::Base
  
  attr_accessible :email, :name, :password, :password_confirmation
  attr_accessor :password
  
  validates :name, :presence => true
  validates :email, :presence => true
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  
  before_save :encrypt_password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  private
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
