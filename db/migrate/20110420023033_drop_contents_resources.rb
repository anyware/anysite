class DropContentsResources < ActiveRecord::Migration
  def self.up
    drop_table :contents_resources
  end

  def self.down
  end
end
