RSpec.describe Saltedge::Connections::Remover do
  subject(:remover) { described_class.call(connection) }

  let(:connection) { create(:connection) }
  let(:api_response) { { 'id' => connection.id, removed: true  } }

  describe '.call' do
    before do
      allow_any_instance_of(SaltedgeGateway).to receive(:remove_connection).and_return(api_response)
    end

    context 'remove connection on Salt Edge' do
      let(:result) { remover }

      it ' destroy connection locally' do
        expect { result }.to change(Connection, :count).by(-1)
      end
    end
  end
end
