class AddHtmlToContents < ActiveRecord::Migration
  def self.up
    add_column :contents, :html, :string
  end

  def self.down
    remove_column :contents, :html
  end
end
