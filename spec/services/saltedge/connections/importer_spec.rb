RSpec.describe Saltedge::Connections::Importer do
  subject(:importer) { described_class.call }

  let(:customer) { create(:customer) }
  let(:api_response) { [{ 'id' => 2, 'customer_id' => customer.id, 'provider_id' => provider.id }] }
  let(:provider) { Provider.fakebank }

  describe '.call' do
    before do
      allow_any_instance_of(SaltedgeGateway).to receive(:list_connections).and_return(api_response)
    end

    context 'fetch list connections' do
      let(:result) { importer }

      it ' save imported connections' do
        expect { result }.to change(Connection, :count).by(api_response.count)
      end
    end
  end
end
