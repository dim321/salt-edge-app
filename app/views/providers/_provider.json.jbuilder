# frozen_string_literal: true

json.extract! provider, :id, :saltedge_id, :name, :code, :mode, :status, :created_at, :updated_at
json.url provider_url(provider, format: :json)
