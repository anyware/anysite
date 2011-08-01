class AddSlugToContents < ActiveRecord::Migration
  def self.up
    add_column :contents, :slug, :string
  end

  def self.down
    remove_column :contents, :slug
  end
end
