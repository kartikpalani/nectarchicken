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

ActiveRecord::Schema.define(version: 20141209060922) do

  create_table "balance_sheets", force: true do |t|
    t.integer  "cash"
    t.integer  "inventory_total"
    t.integer  "receivable"
    t.integer  "payable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bills", force: true do |t|
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "customers", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "ssn"
    t.integer  "withholding"
    t.float    "salary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "pay_date"
  end

  create_table "fixed_assets", force: true do |t|
    t.integer  "asset_cost"
    t.integer  "asset_loan"
    t.integer  "asset_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "asset_name"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "costprice"
    t.decimal  "sellprice"
    t.integer  "vendor_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.decimal  "amt_paid"
    t.decimal  "amt_debt"
    t.decimal  "amt_sold"
    t.decimal  "amt_loaned"
    t.integer  "buy_quantity"
    t.integer  "sell_quantity"
  end

  create_table "vendors", force: true do |t|
    t.string   "vendorname"
    t.string   "itemname"
    t.float    "pricepunit"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
