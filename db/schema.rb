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

ActiveRecord::Schema.define(:version => 20101110205939) do

  create_table "datasets", :force => true do |t|
    t.string   "jobid"
    t.integer  "user_id"
    t.string   "person"
    t.string   "conditions"
    t.string   "replicate"
    t.string   "cellType"
    t.string   "factor"
    t.decimal  "numReads",      :precision => 10, :scale => 0
    t.decimal  "mappedReads",   :precision => 10, :scale => 0
    t.decimal  "unmappedReads", :precision => 10, :scale => 0
    t.decimal  "averageCPL",    :precision => 10, :scale => 0
    t.decimal  "medianCPL",     :precision => 10, :scale => 0
    t.decimal  "minCPL",        :precision => 10, :scale => 0
    t.decimal  "maxCPL",        :precision => 10, :scale => 0
    t.string   "aligner"
    t.string   "system"
    t.string   "alignParams"
    t.string   "refGenome"
    t.text     "files"
    t.text     "filesURL"
    t.string   "sequencer"
    t.string   "barcode"
    t.date     "dateDone"
    t.date     "dateRec"
    t.decimal  "lanes",         :precision => 10, :scale => 0
    t.text     "comments"
    t.string   "otherInfo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "datasets", ["user_id"], :name => "index_datasets_on_user_id"

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
    t.string   "background"
    t.text     "blurb"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
