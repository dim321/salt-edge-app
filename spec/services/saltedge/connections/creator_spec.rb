RSpec.describe Saltedge::Connections::Creator do
  subject(:creator) { described_class.call(customer) }

  let(:customer) { create(:customer) }
  let(:api_response) { { 'id' => 2, 'customer_id' => customer.id, 'provider_id' => provider.id } }
  let(:provider) { Provider.fakebank }

  describe '.call' do
    before do
      allow_any_instance_of(SaltedgeGateway).to receive(:create_connection).and_return(api_response)
    end

    context 'create connection' do
      let(:result) { creator }

      it 'returns Connection instance' do
        expect(result).to be_an_instance_of(Connection)
      end

      it 'customer_id is customer id' do
        expect(result.customer_id).to eq(customer.id.to_s)
      end

      it 'save created connection' do
        expect { result }.to change(Connection, :count).by(1)
      end
    end
  end
end
