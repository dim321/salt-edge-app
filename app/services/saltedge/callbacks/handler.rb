# frozen_string_literal: true

module Saltedge
  module Callbacks
    # class Saltedge::Callbacks::Handler is the Service object responsible
    # for handling callbacks from Salt Edge API
    class Handler < ApplicationService
      attr_reader :type, :body

      def initialize(type, body)
        @type = type
        @body = body
      end

      def call
        if type == 'success'
          Saltedge::Accounts::Importer.call(user)
          Saltedge::Transactions::Importer.call(user)
        elsif type == 'failure'
          # TODO: something else
        end
      end

      private

      def customer
        Customer.find customer_id
      end

      def user
        customer.user
      end

      def customer_id
        payload['customer_id']
      end

      def payload
        body['data']
      end
    end
  end
end
