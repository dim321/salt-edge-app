module Saltedge
  module ApiClient
    creds = Rails.application.credentials.saltedge
    @app_id = creds.app_id
    @secret = creds.secret
    @api_url = creds.api_url

    def self.connection
      @connection ||= Faraday.new(
        url: @api_url,
        headers: {
          'Content-Type': 'application/json',
          Accept: 'application/json',
          'App-id': @app_id,
          'Secret': @secret
        }
      ) do |conn|
        conn.request :url_encoded
        conn.response :raise_error
        conn.response :logger, Rails.logger, headers: true, bodies: true, log_level: :debug

        conn.adapter Faraday.default_adapter
      end
    end
  end
end
