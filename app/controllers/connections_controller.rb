# frozen_string_literal: true

class ConnectionsController < ApplicationController
  before_action :set_customer
  before_action :set_connection, only: %i[show edit update destroy]

  # GET /connections or /connections.json
  def index
    @connections = @customer.connections.all
  end

  # GET /connections/1 or /connections/1.json
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

  # GET /connections/1/edit
  def edit; end

  # POST /connections or /connections.json
  def create
    @connection = Connection.new(connection_params)

    respond_to do |format|
      if @connection.save
        format.html { redirect_to connection_url(@connection), notice: 'Connection was successfully created.' }
        format.json { render :show, status: :created, location: @connection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connections/1 or /connections/1.json
  def update
    respond_to do |format|
      if @connection.update(connection_params)
        format.html { redirect_to connection_url(@connection), notice: 'Connection was successfully updated.' }
        format.json { render :show, status: :ok, location: @connection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connections/1 or /connections/1.json
  def destroy
    result = Saltedge::Connections::Remover.call(@connection)

    respond_to do |format|
      if result
        format.html { redirect_to connections_url, notice: 'Connection was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
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
