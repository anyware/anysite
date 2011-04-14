class AddTemplateToContents < ActiveRecord::Migration
  def self.up
    add_column :contents, :template, :string
  end

  def self.down
    remove_column :contents, :template
  end
end
