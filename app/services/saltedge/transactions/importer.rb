module Saltedge
  module Transactions
    # class Saltedge::Transactions::Importer is the Service object responsible
    # for fetch all transactions for all accounts via Salt Edge API
    class Importer < ApplicationService
      attr_reader :accounts, :connections

      def initialize
        @connections = ::Connection.all
        @saltedge_gateway = Gateways.saltedge_gateway
      end

      def call
        connections.each do |connection|
          fetch_transactions(connection, connection.accounts)
        end
      end

      def fetch_transactions(connection, accounts)
        accounts.each do |account|
          transactions = @saltedge_gateway.list_transactions(connection, account)
          Transaction.upsert_all transactions
        end
      end
    end
  end
end
