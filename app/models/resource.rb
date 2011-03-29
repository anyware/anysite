class Resource < ActiveRecord::Base
  belongs_to :folder
  acts_as_list
end
