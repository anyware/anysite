class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.column :name, :string, :null => false
      t.column :description, :string
      t.column :created_by, :integer
      t.column :updated_by, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :folder_id, :integer, :null => false
      t.column :position, :integer ,:null => false
      t.column :menu_title, :string
    end
  end

  def self.down
    drop_table :pages
  end
end
