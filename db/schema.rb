# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090111185618) do

  create_table "folders", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "homepage"
    t.integer  "parent_id"
    t.integer  "position",    :null => false
    t.string   "menu_title"
    t.integer  "template_id"
  end

  create_table "pages", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "folder_id",   :null => false
    t.integer  "position",    :null => false
    t.string   "menu_title"
    t.text     "html"
    t.integer  "template_id"
  end

  create_table "resource_folders", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "position",    :null => false
  end

  create_table "resources", :force => true do |t|
    t.string   "name",                                      :null => false
    t.string   "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resource_folder_id"
    t.integer  "position",                                  :null => false
    t.string   "filetype",           :default => "unknown", :null => false
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
  end

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "top"
    t.boolean  "page"
    t.boolean  "folder"
    t.boolean  "bottom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
