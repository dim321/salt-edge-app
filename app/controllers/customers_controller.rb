# frozen_string_literal: true

class CustomersController < ApplicationController
  # GET /customers
  def index
    @customers = Customer.where(user_id: current_user.id)
  end

  def new
    customer = Saltedge::Customer::Creator.call(current_user)
    
    if customer
      redirect_to customers_path, notice: 'Customer was successfully created.'
    else
      redirect_to customers_path, status: :unprocessable_entity
    end
  end
end
