class AddAttachmentToResource < ActiveRecord::Migration
  def self.up
    add_column :resources, :content_type, :string
    add_column :resources, :filename, :string
    add_column :resources, :thumbnail, :string
    add_column :resources, :size, :integer
    add_column :resources, :width, :integer
    add_column :resources, :height, :integer
  end

  def self.down
    remove_column :resources, :height
    remove_column :resources, :width
    remove_column :resources, :size
    remove_column :resources, :thumbnail
    remove_column :resources, :filename
    remove_column :resources, :content_type
  end
end
