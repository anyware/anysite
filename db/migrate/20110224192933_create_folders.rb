class CreateFolders < ActiveRecord::Migration
  def self.up
    create_table :folders do |t|
      t.string :name
      t.string :description
      t.integer :created_by
      t.integer :updated_by
      t.integer :position
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :folders
  end
end
