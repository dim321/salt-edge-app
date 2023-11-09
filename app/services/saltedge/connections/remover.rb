# frozen_string_literal: true

module Saltedge
  module Connections
    # class Saltedge::Connections::Remover is the Service object responsible
    # for removing connection by id via Salt Edge API and delete it in local DB
    class Remover < ApplicationService
      attr_reader :connection

      def initialize(connection)
        @connection = connection
        @saltedge_gateway = Gateways.saltedge_gateway
      end

      def call
        Connection.destroy(connection.id) if @saltedge_gateway.remove_connection(connection)
      end
    end
  end
end
