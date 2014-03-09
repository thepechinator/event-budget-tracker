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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140309203735) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "date"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.float    "total"
    t.text     "description"
    t.datetime "due_date"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expenses", ["event_id"], name: "index_expenses_on_event_id", using: :btree

  create_table "payments", force: true do |t|
    t.float    "amount"
    t.text     "description"
    t.datetime "date"
    t.integer  "expense_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["expense_id"], name: "index_payments_on_expense_id", using: :btree

  create_table "spending_pools", force: true do |t|
    t.string   "source"
    t.float    "amount"
    t.text     "description"
    t.datetime "received_on"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spending_pools", ["event_id"], name: "index_spending_pools_on_event_id", using: :btree

end
