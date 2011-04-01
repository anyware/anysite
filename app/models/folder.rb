class Folder < ActiveRecord::Base
  acts_as_tree
  acts_as_list :scope => "ancestry"
  has_many :resources
  has_one :creator, :foreign_key => "created_by"
  has_one :editor, :foreign_key => "edited_by"
end
