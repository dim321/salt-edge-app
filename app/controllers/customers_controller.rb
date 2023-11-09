# frozen_string_literal: true

class CustomersController < ApplicationController
  # GET /customers
  def index
    @customers = Customer.where(user_id: current_user.id)
  end
end
