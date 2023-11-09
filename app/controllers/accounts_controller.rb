# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :set_account, only: :show
  before_action :set_accounts, only: :index

  # GET /accounts
  def index; end

  # GET /accounts/1
  def show; end

  # GET /accounts/new
  def new
    # Import accounts for new connection
    accounts = Saltedge::Accounts::Importer.call(current_user)

    if accounts
      redirect_to accounts_url, notice: 'Accounts was successfully imported.'
    else
      redirect_to connections_url, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  def connection
    return connections.last unless params[:connection_id]

    connections.find(params[:connection_id])
  end

  def customer
    current_user.customer
  end

  def connections
    customer.connections
  end

  def set_accounts
    @accounts = connection.accounts
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:connection_id, :name, :nature, :balance, :currency_code, :extra)
  end
end
