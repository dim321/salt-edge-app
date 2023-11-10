describe "the signin process", type: :feature do
  let(:user) { create(:user) }

  it "signs me in" do
    visit '/'
    within("#new_user") do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_button 'commit'
    expect(page).to have_content 'Customer'
    expect(page).to have_content user.email
  end
end
