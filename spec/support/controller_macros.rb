module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end

  def register_user
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.build(:user)
      sign_up user
    end
  end
end