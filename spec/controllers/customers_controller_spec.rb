RSpec.describe CustomersController do
  subject { response }

  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'get index' do
    let(:customer) { user.create(:customer) }

    before do
      get :index
    end

    context 'list customers' do
      it { is_expected.to be_successful }
    end
  end

  describe 'new customer' do
    let(:api_response) { { 'id' => 2, 'identifier' => user.email } }

    before do
      allow_any_instance_of(SaltedgeGateway).to receive(:create_customer).and_return(api_response)      
    end

    context 'create new customer' do
      it 'then redirect' do
        get :new
        expect(response.status).to eq(302)
        expect(response).to redirect_to('/customers')
      end
    end
  end
end