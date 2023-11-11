# frozen_string_literal: true

class SaltedgeGateway
  attr_reader :conn

  def initialize
    @conn = Saltedge::ApiClient.connection
  end

  def create_customer(identifier)
    params = {
      data: {
        identifier:
      }
    }
    response = conn.post('customers', params.to_json)
    data response
  end

  def list_customers
    response = conn.get('customers')
    data response
  end

  def create_connection(payload)
    params = {
      data: payload
    }
    response = conn.post('connections', params.to_json)
    data response
  end

  def list_connections(customer)
    response = conn.get("connections?customer_id=#{customer.id}")
    data response
  end

  def remove_connection(connection)
    response = conn.delete("connections/#{connection.id}")
    data response
  end

  def reconnect_connection(connection, payload)
    params = {
      data: payload
    }
    response = conn.put("connections/#{connection.id}/reconnect", params.to_json)
    data response
  end

  def refresh_connection(connection, payload)
    params = {
      data: payload
    }
    response = conn.put("connections/#{connection.id}/refresh", params.to_json)
    data response
  end

  def list_accounts(connection)
    response = conn.get("accounts?connection_id=#{connection.id}")
    data response
  end

  def list_transactions(connection, account)
    response = conn.get("transactions?connection_id=#{connection.id}&account_id=#{account.id}")
    data response
  end

  private

  def data(response)
    JSON.parse(response.body)['data']
  end
end
