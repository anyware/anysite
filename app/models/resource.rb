class Resource < ActiveRecord::Base
  belongs_to :folder
  acts_as_list
  has_one :creator, :foreign_key => "created_by"
  has_one :editor, :foreign_key => "edited_by"
  
  has_attached_file :source, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :path => ":rails_root/public/system/:attachment/:id/:style/:filename"
end
