require 'rails_helper'

RSpec.describe RefreshingConnectionsJob, type: :job do
  describe "#perform_later" do
    it "refresh all connections" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        RefreshingConnectionsJob.perform_later
      }.to have_enqueued_job
    end
  end
end
