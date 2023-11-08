# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.references :connection, null: false, foreign_key: true
      t.string :name
      t.string :nature
      t.decimal :balance, precision: 19, scale: 10, null: false, default: 0.0
      t.string :currency_code, limit: 3
      t.string :extra

      t.timestamps
    end
  end
end
