require 'rails_helper'

RSpec.feature 'Users Feature', type: :feature do
  let(:user) { create(:user) }

  it 'test' do
    sign_in user
    expect(page).to have_content(user.name)
  end

  def sign_in(user = nil)
    visit send("new_user_session_path")
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("SIGN IN")
  end
end
