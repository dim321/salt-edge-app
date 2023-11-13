# frozen_string_literal: true

module Saltedge
  module Connections
    # class Saltedge::Connections::Refresher is the Service object responsible
    # to trigger a refetch of the data associated with a specific connection (accounts and transactions)
    class Refresher < ApplicationService
      attr_reader :connection

      def initialize(connection)
        @connection = connection
        @saltedge_gateway = Gateways.saltedge_gateway
      end

      def call
        refresh = @saltedge_gateway.refresh_connection(connection, payload)
      end

      def payload
        {
          "data": {
            "attempt": {
              "fetch_scopes": [
                "accounts",
                "transactions"
              ]
            }
          }
        }
      end
    end
  end
end
