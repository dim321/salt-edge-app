module CallbacksHelper
  def verify_signature(data, signature)
    public_key = OpenSSL::PKey::RSA.new(File.open("config/public.pem"))
    public_key.verify(OpenSSL::Digest.new("SHA256"), Base64.decode64(signature), data)
  rescue
    false
  end

  def signature_body
    "http://#{ENV['CALLBACK_URL']}:#{ENV{"CALLBACK_PORT"}}/api/callbacks/#{type}|#{body}"
  end
end
