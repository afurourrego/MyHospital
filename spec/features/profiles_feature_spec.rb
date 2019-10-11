require 'rails_helper'

RSpec.feature 'Profiles Feature', type: :feature do
  let(:user) { create(:user) }
  let(:administrator) { create(:administrator) }
  let(:doctor) { create(:doctor) }

  before do
    User.current = user
  end

  it "should user admin can create patients" do
    sign_in administrator
    visit send("profiles_path")

    find('.btn_link_to', text: "NEW").click
    fill_in "Card", with: 123456789
    fill_in "Full Name", with: "ramiro"
    fill_in "Phone", with: "11111111111"
    click_button("SAVE")

    visit send("profiles_path")
    expect(page).to have_content("ramiro")
  end

  it "should user doctor cannot create patients" do
    sign_in doctor
    visit send("profiles_path")
    expect(page).not_to have_content("NEW")
  end






  def sign_in(user = nil)
    visit send("new_user_session_path")
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("SIGN IN")
  end
end
