class Folder < ActiveRecord::Base
  has_many :pages, :order => :position, :dependent => :delete_all
  belongs_to :template
  acts_as_ordered_tree :order => :position
end
