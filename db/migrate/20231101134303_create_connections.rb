# frozen_string_literal: true

class CreateConnections < ActiveRecord::Migration[7.1]
  def change
    create_table :connections do |t|
      t.string :categorization
      t.string :secret
      t.string :provider_id
      t.string :provider_code
      t.string :provider_name
      t.boolean :daily_refresh
      t.string :customer_id
      t.datetime :last_success_at
      t.integer :status
      t.string :country_code
      t.datetime :next_refresh_possible_at
      t.boolean :store_credentials
      t.string :last_attempt
      t.boolean :show_consent_confirmation
      t.string :last_consent_id

      t.timestamps
    end
  end
end
