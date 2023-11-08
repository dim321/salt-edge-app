# frozen_string_literal: true

json.extract! account, :id, :connection_id, :name, :nature, :balance, :currency_code, :extra, :created_at, :updated_at
json.url account_url(account, format: :json)
