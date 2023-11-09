# frozen_string_literal: true

class CreateProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :providers do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.integer :mode, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
