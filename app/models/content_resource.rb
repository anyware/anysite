class ContentResource < ActiveRecord::Base
  belongs_to :resource
  belongs_to :content
end
