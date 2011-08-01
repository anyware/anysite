class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :name
      t.string :description
      t.integer :created_by
      t.integer :updated_by
      t.integer :folder_id
      t.integer :position
      t.string :filetype

      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
