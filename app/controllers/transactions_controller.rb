# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_transaction, only: :show
  before_action :set_transactions, only: :index

  # GET /transactions
  def index
    # @transactions = Transaction.all
  end

  # GET /transactions/1
  def show; end

  # GET /transactions/new
  def new
    transactions = Saltedge::Transactions::Importer.call(current_user)

    if transactions
      redirect_to transactions_url(account_id: params[:account_id]), notice: 'Transactions was successfully imported.'
    else
      redirect_to connections_url, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_transactions
    @transactions = Account.find(params[:account_id]).transactions
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:account_id, :duplicated, :mode, :status, :made_on, :amount, :currency_code,
                                        :description, :category, :extra)
  end
end
