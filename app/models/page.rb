class Page < ActiveRecord::Base
  belongs_to :folder
  belongs_to :template
  acts_as_list
end
