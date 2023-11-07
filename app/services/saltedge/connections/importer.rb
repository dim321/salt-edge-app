module Saltedge
  module Connections
    # class Saltedge::Connections::Importer is the Service object responsible
    # for fetch all connections for all customers via Salt Edge API
    class Importer < ApplicationService
      attr_reader :customers

      def initialize
        @customers = ::Customer.all
        @saltedge_gateway = Gateways.saltedge_gateway
      end

      def call
        customers.each do |customer|
          connections = @saltedge_gateway.list_connections(customer)
          Connection.upsert_all connections
        end
      end
    end
  end
end
