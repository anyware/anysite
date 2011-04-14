class AddPartialTemplateToContents < ActiveRecord::Migration
  def self.up
    add_column :contents, :partial_template, :string
  end

  def self.down
    remove_column :contents, :partial_template
  end
end
