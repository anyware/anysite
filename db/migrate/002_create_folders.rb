class CreateFolders < ActiveRecord::Migration
  def self.up
    create_table :folders do |t|
      t.column :name, :string, :null => false
      t.column :description, :string
      t.column :created_by, :integer
      t.column :updated_by, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :homepage, :boolean
      t.column :parent_id, :integer
      t.column :position, :integer ,:null => false
      t.column :menu_title, :string
    end
    Folder.create :name => "Default Homepage", :description => "Change this to your site name", :homepage => true, :created_at =>Time.now, :position => 1
  end

  def self.down
    drop_table :folders
  end
end
