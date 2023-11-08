# frozen_string_literal: true

require 'test_helper'

class ConnectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @connection = connections(:one)
  end

  test 'should get index' do
    get connections_url
    assert_response :success
  end

  test 'should get new' do
    get new_connection_url
    assert_response :success
  end

  test 'should create connection' do
    assert_difference('Connection.count') do
      post connections_url,
           params: { connection: { country_code: @connection.country_code, customer_id: @connection.customer_id,
                                   daily_refresh: @connection.daily_refresh, last_attempt: @connection.last_attempt, last_consent_id: @connection.last_consent_id, last_success_at: @connection.last_success_at, next_refresh_possible_at: @connection.next_refresh_possible_at, provider_code: @connection.provider_code, provider_id: @connection.provider_id, provider_name: @connection.provider_name, saltedge_id: @connection.saltedge_id, secret: @connection.secret, show_consent_confirmation: @connection.show_consent_confirmation, status: @connection.status, store_credentials: @connection.store_credentials } }
    end

    assert_redirected_to connection_url(Connection.last)
  end

  test 'should show connection' do
    get connection_url(@connection)
    assert_response :success
  end

  test 'should get edit' do
    get edit_connection_url(@connection)
    assert_response :success
  end

  test 'should update connection' do
    patch connection_url(@connection),
          params: { connection: { country_code: @connection.country_code, customer_id: @connection.customer_id,
                                  daily_refresh: @connection.daily_refresh, last_attempt: @connection.last_attempt, last_consent_id: @connection.last_consent_id, last_success_at: @connection.last_success_at, next_refresh_possible_at: @connection.next_refresh_possible_at, provider_code: @connection.provider_code, provider_id: @connection.provider_id, provider_name: @connection.provider_name, saltedge_id: @connection.saltedge_id, secret: @connection.secret, show_consent_confirmation: @connection.show_consent_confirmation, status: @connection.status, store_credentials: @connection.store_credentials } }
    assert_redirected_to connection_url(@connection)
  end

  test 'should destroy connection' do
    assert_difference('Connection.count', -1) do
      delete connection_url(@connection)
    end

    assert_redirected_to connections_url
  end
end
