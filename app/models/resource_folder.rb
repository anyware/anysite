class ResourceFolder < ActiveRecord::Base
  has_many :resources, :order => :position, :dependent => :delete_all
  acts_as_ordered_tree :order => :position
end
