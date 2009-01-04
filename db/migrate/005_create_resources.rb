class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
        t.column :name, :string, :null => false, :unique => true
        t.column :description, :string
        t.column :created_by, :integer
        t.column :updated_by, :integer
        t.column :created_at, :datetime
        t.column :updated_at, :datetime
        t.column :resource_folder_id, :integer
        t.column :position, :integer ,:null => false
        t.column :filetype, :string, :null => false, :default => "unknown"
      end
  end

  def self.down
    drop_table :resources
  end
end
