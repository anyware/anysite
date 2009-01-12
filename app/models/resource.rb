class Resource < ActiveRecord::Base
  belongs_to :resource_folder
  acts_as_list
  
  has_attachment  :storage => :file_system,
                  :max_size => 10.megabytes,
                  :thumbnails => {:s100 => '100x100>', :s200 => '200x200>',
                                  :s300 => '300x300>', :s400 => '400x400>'},
                  :path_prefix => 'public/assets/resources',
                  :processor => 'ImageScience'
                  
  validates_as_attachment
end
