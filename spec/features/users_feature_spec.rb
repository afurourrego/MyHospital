require 'rails_helper'

RSpec.feature 'Users Feature', type: :feature do
  let(:user) { create(:user) }
  let(:administrator) { create(:administrator) }
  let(:doctor) { create(:doctor) }

  before do
    User.current = user
  end

  it 'should can login if user has registred' do
    sign_in user
    expect(page).to have_content(user.name)
    expect(page).not_to have_content('SIGN IN')
  end

  it 'should cannot login if email and password are incorrect' do
    visit send("new_user_session_path")
    fill_in "Email", with: user.email
    fill_in "Password", with: '1111111'
    click_button("SIGN IN")

    expect(page).not_to have_content(user.name)
    expect(page).to have_content('SIGN IN')
  end

  it 'should cannot create user if user is super admin' do
    sign_in user
    expect(page).to have_content(user.name)
    expect(page).to have_content('Invite User')
  end

  it 'should cannot create user if user is administrator' do
    sign_in administrator
    expect(page).to have_content(administrator.name)
    expect(page).not_to have_content('Invite User')
  end

  it 'should cannot create user if user is doctor' do
    sign_in doctor
    expect(page).to have_content(doctor.name)
    expect(page).not_to have_content('Invite User')
  end




  def sign_in(user = nil)
    visit send("new_user_session_path")
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("SIGN IN")
  end
end
