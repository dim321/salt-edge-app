RSpec.describe Saltedge::Customer::Creator do
  subject(:creator) { described_class.call(user) }

  let(:user) { create(:user) }
  let(:api_response) { { 'id' => 2, 'identifier' => user.email } }

  describe '.call' do
    before do
      allow_any_instance_of(SaltedgeGateway).to receive(:create_customer).and_return(api_response)
    end

    context 'create customer' do
      let(:result) { creator }

      it 'returns Customer instance' do
        expect(result).to be_an_instance_of(Customer)
      end

      it 'customer identifier is user email' do
        expect(result.identifier).to eq(user.email)
      end

      it 'save created customer' do
        expect { result }.to change(Customer, :count).by(1)
      end
    end
  end
end
