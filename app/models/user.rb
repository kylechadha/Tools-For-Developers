class User
  include Mongoid::Document
  field :email, type: String
  field :name, type: String
  field :password_salt, type: String
  field :password_hash, type: String
end
