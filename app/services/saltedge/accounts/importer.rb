module Saltedge
  module Accounts
    # class Saltedge::Accounts::Importer is the Service object responsible
    # for fetch all accounts for all connections via Salt Edge API
    class Importer < ApplicationService
      attr_reader :connections

      def initialize
        @connections = ::Connection.all
        @saltedge_gateway = Gateways.saltedge_gateway
      end

      def call
        connections.each do |connection|
          accounts = @saltedge_gateway.list_accounts(connection)
          Account.upsert_all accounts
        end
      end
    end
  end
end
