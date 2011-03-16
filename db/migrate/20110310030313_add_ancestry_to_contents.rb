class AddAncestryToContents < ActiveRecord::Migration
  def self.up
    add_column :contents, :ancestry, :string
    add_index :contents, :ancestry
  end

  def self.down
    remove_column :contents, :ancestry
  end
end
