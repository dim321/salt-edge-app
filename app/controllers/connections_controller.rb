# frozen_string_literal: true

class ConnectionsController < ApplicationController
  before_action :set_customer
  before_action :set_connection, only: %i[show destroy]

  # GET /connections 
  def index
    @connections = @customer.connections.all
  end

  # GET /connections/1 
  def show; end

  # GET /connections/new
  def new
    # Create new connection
    @connection = Saltedge::Connections::Creator.call(@customer)

    if @connection
      redirect_to connections_url, notice: 'Connection was successfully created.'
    else
      redirect_to connections_url, status: :unprocessable_entity
    end
  end

  # DELETE /connections/1
  def destroy
    result = Saltedge::Connections::Remover.call(@connection)

    respond_to do |format|
      if result
        format.html { redirect_to connections_url, notice: 'Connection was successfully destroyed.' }
      else
        format.html { redirect_to connections_url, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_connection
    @connection = @customer.connections.find_by_id(params[:id])
  end

  def set_customer
    @customer = current_user.customer
  end

  # Only allow a list of trusted parameters through.
  def connection_params
    params.require(:connection).permit(:id, :secret, :provider_id, :provider_code, :provider_name, :daily_refresh,
                                       :customer_id, :last_success_at, :status, :country_code, :next_refresh_possible_at, :store_credentials, :last_attempt, :show_consent_confirmation, :last_consent_id)
  end
end
