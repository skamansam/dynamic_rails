# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130417193621) do

  create_table "constraints", :force => true do |t|
    t.string   "name"
    t.string   "for_type"
    t.text     "data_options"
    t.text     "input_options"
    t.integer  "for_object_id"
    t.string   "for_object_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "list_items", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.text     "extra_data"
    t.integer  "list_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "list_items", ["list_id"], :name => "index_list_items_on_list_id"

  create_table "lists", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.text     "extra_data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
