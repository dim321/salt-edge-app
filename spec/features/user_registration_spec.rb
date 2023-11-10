describe "the registration process", type: :feature do
  before do
    allow_any_instance_of(SaltedgeGateway).to receive(:create_customer).and_return(api_response)
  end

  let(:user) { build(:user) }
  let(:api_response) { { 'id' => 2, 'identifier' => user.email } }

  it "register new user and create new customer for him" do
    visit '/'
    click_link 'Sign up'
    within("#new_user") do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
    end
    click_button 'commit'
    expect(page).to have_content 'Customer'
    expect(Customer.last.identifier).to eq(User.last.email)
    expect(page).to have_content user.email
  end
end
