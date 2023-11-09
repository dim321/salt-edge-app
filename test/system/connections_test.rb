# frozen_string_literal: true

require 'application_system_test_case'

class ConnectionsTest < ApplicationSystemTestCase
  setup do
    @connection = connections(:one)
  end

  test 'visiting the index' do
    visit connections_url
    assert_selector 'h1', text: 'Connections'
  end

  test 'should create connection' do
    visit connections_url
    click_on 'New connection'

    fill_in 'Country code', with: @connection.country_code
    fill_in 'Customer', with: @connection.customer_id
    check 'Daily refresh' if @connection.daily_refresh
    fill_in 'Last attempt', with: @connection.last_attempt
    fill_in 'Last consent', with: @connection.last_consent_id
    fill_in 'Last success at', with: @connection.last_success_at
    fill_in 'Next refresh possible at', with: @connection.next_refresh_possible_at
    fill_in 'Provider code', with: @connection.provider_code
    fill_in 'Provider', with: @connection.provider_id
    fill_in 'Provider name', with: @connection.provider_name
    fill_in 'Saltedge', with: @connection.saltedge_id
    fill_in 'Secret', with: @connection.secret
    check 'Show consent confirmation' if @connection.show_consent_confirmation
    fill_in 'Status', with: @connection.status
    check 'Store credentials' if @connection.store_credentials
    click_on 'Create Connection'

    assert_text 'Connection was successfully created'
    click_on 'Back'
  end

  test 'should update Connection' do
    visit connection_url(@connection)
    click_on 'Edit this connection', match: :first

    fill_in 'Country code', with: @connection.country_code
    fill_in 'Customer', with: @connection.customer_id
    check 'Daily refresh' if @connection.daily_refresh
    fill_in 'Last attempt', with: @connection.last_attempt
    fill_in 'Last consent', with: @connection.last_consent_id
    fill_in 'Last success at', with: @connection.last_success_at
    fill_in 'Next refresh possible at', with: @connection.next_refresh_possible_at
    fill_in 'Provider code', with: @connection.provider_code
    fill_in 'Provider', with: @connection.provider_id
    fill_in 'Provider name', with: @connection.provider_name
    fill_in 'Saltedge', with: @connection.saltedge_id
    fill_in 'Secret', with: @connection.secret
    check 'Show consent confirmation' if @connection.show_consent_confirmation
    fill_in 'Status', with: @connection.status
    check 'Store credentials' if @connection.store_credentials
    click_on 'Update Connection'

    assert_text 'Connection was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Connection' do
    visit connection_url(@connection)
    click_on 'Destroy this connection', match: :first

    assert_text 'Connection was successfully destroyed'
  end
end
