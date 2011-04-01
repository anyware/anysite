class AddDefaultHomepageAndFolder < ActiveRecord::Migration
  def self.up
    Content.create :name => "Homepage", :description => "Change this to your site name"
    Folder.create :name => "Resources", :description => "Change this to your site name"
  end

  def self.down
  end
end
