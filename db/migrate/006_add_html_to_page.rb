class AddHtmlToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :html, :text
  end

  def self.down
    remove_column :pages, :html
  end
end
