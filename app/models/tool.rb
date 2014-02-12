class Tool
  include Mongoid::Document
  field :name, type: String
  field :desc, type: String
  field :url, type: String
  field :screenshot, type: String

  belongs_to :user
  belongs_to :app_type
  has_and_belongs_to_many :categories
end
