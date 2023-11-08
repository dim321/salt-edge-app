# frozen_string_literal: true

json.extract! connection, :id, :saltedge_id, :secret, :provider_id, :provider_code, :provider_name, :daily_refresh,
              :customer_id, :last_success_at, :status, :country_code, :next_refresh_possible_at, :store_credentials, :last_attempt, :show_consent_confirmation, :last_consent_id, :created_at, :updated_at
json.url connection_url(connection, format: :json)
