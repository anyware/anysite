class AddPositionToContentsResources < ActiveRecord::Migration
  def self.up
    add_column :contents_resources, :position, :integer
  end

  def self.down
    remove_column :contents_resources, :position
  end
end
