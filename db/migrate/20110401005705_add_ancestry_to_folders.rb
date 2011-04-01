class AddAncestryToFolders < ActiveRecord::Migration
  def self.up
    add_column :folders, :ancestry, :string
    add_index :folders, :ancestry
  end

  def self.down
    remove_column :folders, :ancestry
  end
end
