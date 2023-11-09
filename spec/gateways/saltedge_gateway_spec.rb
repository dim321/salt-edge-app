RSpec.describe SaltedgeGateway do
  subject(:gateway) { described_class.new }

  let(:saltedge_response) { Struct.new(:body, :status) }
  let(:identifier) { 'something_uniq' }

  before do
    allow_any_instance_of(Faraday::Connection).to receive(:post).and_return(response_stub)
    allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(response_stub)
    allow_any_instance_of(Faraday::Connection).to receive(:delete).and_return(response_stub)
  end

  describe '.create_customer' do
    context 'return customer attributes' do
      let(:response_stub) do
        saltedge_response.new({ data: { id: 2, identifier: identifier } }.to_json, 200)
      end

      let(:result) { gateway.create_customer(identifier) }

      it 'as json' do
        expect(result).to be_an_instance_of(Hash)
      end

      it 'with attributes values' do
        expect(result['id']).to eq 2
        expect(result['identifier']).to eq identifier
      end
    end
  end

  describe '.list_customers' do
    context 'return list of customers' do
      let(:response_stub) do
        saltedge_response.new({ data: [{ id: 2, identifier: identifier }] }.to_json, 200)
      end

      let(:result) { gateway.list_customers }

      it 'as Array of customers ' do
        expect(result).to be_an_instance_of(Array)
      end

      it 'with attributes values' do
        expect(result[0]['id']).to eq 2
        expect(result[0]['identifier']).to eq identifier
      end
    end
  end

  describe '.create_connection' do
    context 'return created connection attributes' do
      let(:response_stub) do
        saltedge_response.new({ data: { id: 2 } }.to_json, 200)
      end

      let(:payload) { {} }

      let(:result) { gateway.create_connection(payload) }

      it 'as json' do
        expect(result).to be_an_instance_of(Hash)
      end

      it 'with attributes values' do
        expect(result['id']).to eq 2
      end
    end
  end

  describe '.list_connections' do
    context 'return list of connections for customer' do
      let(:response_stub) do
        saltedge_response.new({ data: [{ id: 2, customer_id: customer.id }] }.to_json, 200)
      end

      let(:customer) { create(:customer) }

      let(:result) { gateway.list_connections(customer) }

      it 'as Array of Salt Edge connections ' do
        expect(result).to be_an_instance_of(Array)
      end

      it 'with attributes values' do
        expect(result[0]['id']).to eq 2
        expect(result[0]['customer_id']).to eq customer.id
      end
    end
  end

  describe '.remove_connection' do
    context 'remove connection on Salt Edge' do
      let(:response_stub) do
        saltedge_response.new({ data: { id: connection.id, removed: true } }.to_json, 200)
      end

      let(:connection) { create(:connection) }

      let(:result) { gateway.remove_connection(connection) }

      it 'return a Hash ' do
        expect(result).to be_an_instance_of(Hash)
      end

      it 'with attribute removed: true' do
        expect(result['removed']).to eq true
      end
    end
  end

  describe '.list_accounts' do
    context 'return list of accounts for connection' do
      let(:response_stub) do
        saltedge_response.new({ data: [{ id: 2, connection_id: connection.id }] }.to_json, 200)
      end

      let(:connection) { create(:connection) }

      let(:result) { gateway.list_accounts(connection) }

      it 'as Array of accounts for connection ' do
        expect(result).to be_an_instance_of(Array)
      end

      it 'with attributes values' do
        expect(result[0]['id']).to eq 2
        expect(result[0]['connection_id']).to eq connection.id
      end
    end
  end

  describe '.list_transactions' do
    context 'return list of transactions for connection/customer' do
      let(:response_stub) do
        saltedge_response.new({ data: [{ id: 2, account_id: account.id }] }.to_json, 200)
      end

      let(:connection) { create(:connection) }
      let(:account) { create(:account) }

      let(:result) { gateway.list_transactions(connection, account) }

      it 'as Array of Salt Edge connections ' do
        expect(result).to be_an_instance_of(Array)
      end

      it 'with attributes values' do
        expect(result[0]['id']).to eq 2
        expect(result[0]['account_id']).to eq account.id
      end
    end
  end
end
