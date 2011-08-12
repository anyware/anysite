class AddDefaultHomepageAndFolder < ActiveRecord::Migration
  def self.up
    c = Content.new :name => "Homepage", :description => "Change this to your site name"
    c.save(false)
    Folder.create :name => "Resources", :description => "Change this to your site name"
  end

  def self.down
  end
end
