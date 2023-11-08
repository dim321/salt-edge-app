class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]
  before_action :set_accounts, only: :index

  # GET /accounts or /accounts.json
  def index
  end

  # GET /accounts/1 or /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    # Import accounts and transactions for new connection
    accounts = Saltedge::Accounts::Importer.call(current_user)

    if accounts
      redirect_to accounts_url, notice: "Accounts was successfully imported."
    else
      redirect_to connections_url, status: :unprocessable_entity
    end
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.destroy!

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    def connection
      return current_user.customer.connections.last unless params[:connection_id]
      current_user.customer.connections.find(params[:connection_id])
    end

    def set_accounts
      @accounts = connection.accounts
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:connection_id, :name, :nature, :balance, :currency_code, :extra)
    end
end
