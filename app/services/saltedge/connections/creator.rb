# frozen_string_literal: true

module Saltedge
  module Connections
    # class Saltedge::Connections::Creator is the Service object responsible
    # for creating connection for customer via Salt Edge API and saving it in local DB
    class Creator < ApplicationService
      attr_reader :customer, :provider

      def initialize(customer, provider = nil)
        @customer = customer
        @saltedge_gateway = Gateways.saltedge_gateway
        @provider = provider || Provider.fakebank
      end

      def call
        connection = @saltedge_gateway.create_connection(new_connection)
        customer.connections.create connection
      end

      def new_connection
        {
          customer_id: customer.id,
          country_code: 'XF',
          provider_code: provider.code,
          consent: {
            from_date: '2023-11-03',
            scopes: %w[
              account_details
              transactions_details
            ]
          },
          attempt: {
            from_date: '2023-11-03',
            fetch_scopes: %w[
              accounts
              transactions
            ],
            custom_fields: {
              test: true
            }
          },
          credentials: {
            login: 'username',
            password: 'secret'
          }
        }
      end
    end
  end
end
