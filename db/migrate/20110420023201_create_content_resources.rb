class CreateContentResources < ActiveRecord::Migration
  def self.up
    create_table :content_resources do |t|
      t.integer :position
      t.integer :content_id
      t.integer :resource_id
    end
  end

  def self.down
    drop_table :content_resources
  end
end
