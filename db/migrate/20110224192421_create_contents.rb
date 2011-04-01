class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :name
      t.string :description
      t.integer :created_by
      t.integer :updated_by
      t.integer :position

      t.timestamps
    end
    Content.create :name => "Homepage", :description => "Change this to your site name"
  end

  def self.down
    drop_table :contents
  end
end
