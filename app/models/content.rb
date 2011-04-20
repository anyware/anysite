class Content < ActiveRecord::Base
  acts_as_tree
  acts_as_list :scope => "ancestry"
  has_many :content_resources
  has_many :resources, :through => :content_resources, :order => "content_resources.position ASC"
  has_one :creator, :foreign_key => "created_by"
  has_one :editor, :foreign_key => "edited_by" 
  default_scope :order => "position ASC"
end
