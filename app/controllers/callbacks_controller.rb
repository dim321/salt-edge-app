class CallbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def handler
    body = request.body.read
    type = params[:type]

    unless verify_signature(signature_body, request.env["HTTP_SIGNATURE"])
      render json: { body: body }, status: unprocessable_entity
    end

    Saltedge::Callbacks::Handler.call(type, body)
  end
end
