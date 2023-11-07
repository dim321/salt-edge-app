# registry pattern to provide global access to singleton instance
# of Saltedge gateway:
module Gateways
  def self.saltedge_gateway
    @saltedge_gateway ||= SaltedgeGateway.new
  end
end
