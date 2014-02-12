require 'bcrypt'

class User
  include Mongoid::Document
  
  attr_accessor :password

  field :email, type: String
  field :name, type: String
  field :password_salt, type: String
  field :password_hash, type: String
  has_many :tools

  def authenticated?(pswd)
    BCrypt::Password.new(self.password_hash) == pswd
  end

  before_save :encrypt_password
  
  private
    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        self.password = nil
      end
    end

end
