RSpec.describe ConnectionsController do

  let(:user) { create(:user) }
  let!(:customer) { create(:customer, user: user) }
  let!(:provider) { create(:provider) }
  let!(:connection) { create(:connection, customer: customer, provider: provider) }
  let(:api_response) { { 'id' => 10, 'customer_id' => customer.id, 'provider_code' => provider.code } }

  before do
    allow_any_instance_of(SaltedgeGateway).to receive(:create_connection).and_return(api_response)
    allow_any_instance_of(SaltedgeGateway).to receive(:remove_connection).and_return(api_response)
  end

  before do
    sign_in(user)
  end

  describe 'get index' do
    it'list connections' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'get show' do
    it 'connection' do
      get :show, params: { id: connection.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'get new' do
    it 'create new connection' do
      get :new
      expect(response.status).to eq(302)
    end
  end

  describe 'delete connection' do
    let(:api_response) { { 'removed' => true } }
    it 'destroy connection' do
      delete :destroy, params: { id: connection.id }
      expect(response.status).to eq(302)
    end
  end
end
