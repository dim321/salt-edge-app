# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :identifier, null: false
      t.string :secret
      t.datetime :blocked_at

      t.timestamps
    end
    add_index :customers, :identifier
  end
end
