class CreateContentsResourcesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :contents_resources, :id => false do |t|
      t.integer :content_id
      t.integer :resource_id
    end
  end

  def self.down
    drop_table :contents_resources
  end
end
