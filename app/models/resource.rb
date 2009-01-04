class Resource < ActiveRecord::Base
  belongs_to :resource_folder
  acts_as_list
end
