class AppType
  include Mongoid::Document
  field :name, type: String

  has_many :tools
end
