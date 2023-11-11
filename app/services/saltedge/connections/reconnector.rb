# frozen_string_literal: true

module Saltedge
  module Connections
    # class Saltedge::Connections::Reconnector is the Service object responsible
    # for update connection properties via Salt Edge API
    class Reconnector < ApplicationService
      attr_reader :connection, :login, :password, :scopes

      def initialize(connection, **options)
        @connection = connection
        @login = options[:login] || 'login'
        @password = options[:password] || 'secret'
        @scopes = options[:scopes] || %w[account_details transactions_details]
        @saltedge_gateway = Gateways.saltedge_gateway
      end

      def call
        reconnection = @saltedge_gateway.reconnect_connection(connection, payload)
        connection.update reconnection if reconnection
      end

      def payload
        {
          "credentials": {
            "login": login,
            "password": password
          },
          "consent": {
            "scopes": scopes
            },
          "override_credentials": true
        }
      end
    end
  end
end
