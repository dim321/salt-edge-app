module Saltedge
  module Customer
    # class Saltedge::Customer::Creator is the Service object responsible
    # for creating customer entity for user via Salt Edge API and saving it in local DB
    class Creator < ApplicationService
      attr_reader :identifier, :user

      def initialize(user)
        @user = user
        @identifier = @user.email
        @saltedge_gateway = Gateways.saltedge_gateway
      end

      def call
        # firstly creating customer on the Salt Edge side
        customer = @saltedge_gateway.create_customer(identifier)
        # secondly creating customer with received attributes in local DB
        user.create_customer transform(customer)
      end

      private

      def transform(attributes)
        attributes.slice('id', 'identifier', 'secret')
      end
    end
  end
end
