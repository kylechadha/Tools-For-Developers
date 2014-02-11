class Tool
  include Mongoid::Document
  field :name, type: String
  field :desc, type: String
  field :url, type: String
  field :screenshot, type: String
end
