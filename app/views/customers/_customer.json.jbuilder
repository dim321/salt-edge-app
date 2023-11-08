# frozen_string_literal: true

json.extract! customer, :id, :user_id, :saltedge_id, :identifier, :secret, :blocked_at, :created_at, :updated_at
json.url customer_url(customer, format: :json)
