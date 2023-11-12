class RefreshingConnectionsJob < ApplicationJob
  queue_as :default

  def perform
    Connection.all.each do |connection|
      Saltedge::Connection::Refresher.call(connection)
    end
  end
end
