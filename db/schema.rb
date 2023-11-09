# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_231_106_151_822) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'accounts', force: :cascade do |t|
    t.bigint 'connection_id', null: false
    t.string 'name'
    t.string 'nature'
    t.decimal 'balance', precision: 19, scale: 10, default: '0.0', null: false
    t.string 'currency_code', limit: 3
    t.string 'extra'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['connection_id'], name: 'index_accounts_on_connection_id'
  end

  create_table 'connections', force: :cascade do |t|
    t.string 'categorization'
    t.string 'secret'
    t.string 'provider_id'
    t.string 'provider_code'
    t.string 'provider_name'
    t.boolean 'daily_refresh'
    t.string 'customer_id'
    t.datetime 'last_success_at'
    t.integer 'status'
    t.string 'country_code'
    t.datetime 'next_refresh_possible_at'
    t.boolean 'store_credentials'
    t.string 'last_attempt'
    t.boolean 'show_consent_confirmation'
    t.string 'last_consent_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'customers', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'identifier', null: false
    t.string 'secret'
    t.datetime 'blocked_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['identifier'], name: 'index_customers_on_identifier'
    t.index ['user_id'], name: 'index_customers_on_user_id'
  end

  create_table 'providers', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'code', null: false
    t.integer 'mode', default: 0, null: false
    t.integer 'status', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'transactions', force: :cascade do |t|
    t.bigint 'account_id', null: false
    t.boolean 'duplicated'
    t.string 'mode'
    t.string 'status'
    t.datetime 'made_on'
    t.decimal 'amount', precision: 19, scale: 10, default: '0.0', null: false
    t.string 'currency_code', limit: 3
    t.string 'description'
    t.string 'category'
    t.string 'extra'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['account_id'], name: 'index_transactions_on_account_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'nickname', default: ''
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'accounts', 'connections'
  add_foreign_key 'customers', 'users'
  add_foreign_key 'transactions', 'accounts'
end
