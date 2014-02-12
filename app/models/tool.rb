class Tool
  include Mongoid::Document
  include Mongoid::Paperclip

  def self.after_commit(*args, &block)
    args.each do |arg|
    case arg[:on]
      when :destroy
        after_destroy &block
      end
    end
  end

  field :name, type: String
  field :desc, type: String
  field :url, type: String
  # field :screenshot, type: String
  has_mongoid_attached_file :screenshot

  belongs_to :user
  belongs_to :app_type
  has_and_belongs_to_many :categories

  validates_attachment_content_type :screenshot,
     :content_type => /\Aimage\/.*\Z/

end
