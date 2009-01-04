class CreateResourceFolders < ActiveRecord::Migration
  def self.up
    create_table :resource_folders do |t|
      t.column :name, :string, :null => false
      t.column :description, :string
      t.column :created_by, :integer
      t.column :updated_by, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :parent_id, :integer
      t.column :position, :integer ,:null => false
    end
    ResourceFolder.create :name => "Resources Home", :created_at =>Time.now, :position => 1
  end

  def self.down
    drop_table :resource_folders
  end
end
