class CreateTemplates < ActiveRecord::Migration
  def self.up
    create_table :templates do |t|
      t.string :name, :description
      t.boolean :top, :page, :folder, :bottom
      t.timestamps
    end
    Template.create :name => "default", :description => "Default template", :top => true, :page  => true, :folder  => true, :bottom  => true, :created_at =>Time.now
    add_column :pages, :template_id, :integer
    add_column :folders, :template_id, :integer
  end

  def self.down
    remove_column :pages, :template_id, :integer
    remove column :folders, :template_id, :interger
    drop_table :templates
  end
end
