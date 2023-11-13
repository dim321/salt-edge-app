class CallbacksController < ApplicationController
  skip_before_action :authenticate_user!

  def handler
    body = request.body.read
    type = params[:type]
    signature_body = "https://#{callback_url}:#{callback_port}/callbacks/#{type}|#{body}"

    if verify_signature(signature_body, request.env["HTTP_SIGNATURE"])
      Saltedge::Callbacks::Handler.call(type, body)
    else
      render json: { body: body }, status: :unprocessable_entity
    end
  end

  private

  def callback_url
    Rails.application.credentials.callback.url
  end

  def callback_port
    Rails.application.credentials.callback.port
  end

  def verify_signature(data, signature)
    public_key = OpenSSL::PKey::RSA.new(File.open("config/public.pem"))
    public_key.verify(OpenSSL::Digest.new("SHA256"), Base64.decode64(signature), data)
  rescue
    false
  end

end
