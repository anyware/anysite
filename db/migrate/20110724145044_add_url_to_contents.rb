class AddUrlToContents < ActiveRecord::Migration
  def self.up
    add_column :contents, :url, :string
  end

  def self.down
    remove_column :contents, :url
  end
end
