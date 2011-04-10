class AddMenuToContents < ActiveRecord::Migration
  def self.up
    add_column :contents, :menu, :string
  end

  def self.down
    remove_column :contents, :menu
  end
end