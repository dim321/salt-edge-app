# frozen_string_literal: true

require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test 'should get index' do
    get transactions_url
    assert_response :success
  end

  test 'should get new' do
    get new_transaction_url
    assert_response :success
  end

  test 'should create transaction' do
    assert_difference('Transaction.count') do
      post transactions_url,
           params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount,
                                    category: @transaction.category, currency_code: @transaction.currency_code, description: @transaction.description, duplicated: @transaction.duplicated, extra: @transaction.extra, made_on: @transaction.made_on, mode: @transaction.mode, status: @transaction.status } }
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  test 'should show transaction' do
    get transaction_url(@transaction)
    assert_response :success
  end

  test 'should get edit' do
    get edit_transaction_url(@transaction)
    assert_response :success
  end

  test 'should update transaction' do
    patch transaction_url(@transaction),
          params: { transaction: { account_id: @transaction.account_id, amount: @transaction.amount,
                                   category: @transaction.category, currency_code: @transaction.currency_code, description: @transaction.description, duplicated: @transaction.duplicated, extra: @transaction.extra, made_on: @transaction.made_on, mode: @transaction.mode, status: @transaction.status } }
    assert_redirected_to transaction_url(@transaction)
  end

  test 'should destroy transaction' do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end
end
