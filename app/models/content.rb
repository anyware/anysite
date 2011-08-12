class Content < ActiveRecord::Base
  include UrlHelper
  acts_as_tree
  acts_as_list :scope => "ancestry"
  has_many :content_resources
  has_many :resources, :through => :content_resources, :order => "content_resources.position ASC"
  has_one :creator, :foreign_key => "created_by"
  has_one :editor, :foreign_key => "edited_by" 
  has_many :comments, :as => :commentable
  default_scope :order => "position ASC"
  validates_presence_of :name, :message => "can't be blank"
  validates_uniqueness_of :slug, :scope => :ancestry
  validates_uniqueness_of :url, :scope => :ancestry
  
  searchable do
    text :html, :description, :stored => true
    string :name, :url, :ancestry
    integer :id
    integer :parent_id
  end
end