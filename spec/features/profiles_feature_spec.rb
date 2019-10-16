require 'rails_helper'

RSpec.feature 'Profiles Feature', type: :feature do
  let(:user) { create(:user) }
  let(:administrator) { create(:administrator) }
  let(:doctor) { create(:doctor) }

  let(:profile) { create(:profile) }

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

  it "should user admin can search patients" do
    profile
    sign_in administrator
    visit send("profiles_path")

    all('.striped')[0].click
    all('#identification_card option')[1].click

    find(".button_search").click

    expect(page).to have_content("paciente uno")
  end

  it "should user doctor can search patients" do
    profile
    sign_in doctor
    visit send("profiles_path")

    all('.striped')[0].click
    all('#identification_card option')[1].click

    find(".button_search").click

    expect(page).to have_content("paciente uno")
  end

  it "should user admin can update patients" do
    profile
    sign_in administrator
    visit send("profiles_path")

    visit send("edit_profile_path", id: Profile.first.id)
    fill_in "Name", with: "cambio nombre"
    click_button("SAVE")

    visit send("profiles_path")
    expect(page).not_to have_content("paciente uno")
    expect(page).to have_content("cambio nombre")
  end

  it "should user doctor cannot update patients" do
    profile
    sign_in doctor
    visit send("profiles_path")

    visit send("profile_path", id: Profile.first.id)

    expect(page).not_to have_content("EDIT")
  end

  it "should user admin can view to patients" do
    profile
    sign_in administrator
    visit send("profiles_path")

    visit send("profile_path", id: Profile.first.id)
    expect(page).to have_content("EDIT")
  end

  it "should user doctor can view to patients" do
    profile
    sign_in doctor
    visit send("profiles_path")

    visit send("profile_path", id: Profile.first.id)
    expect(page).to have_content("BACK")
  end

  it "should user super admin can destroy patient" do
    profile
    sign_in user
    visit send("profiles_path")

    click_link('delete')

    expect(page).not_to have_content 'paciente uno'
  end

  it "should user admin cannot destroy patient" do
    profile
    sign_in administrator
    visit send("profiles_path")

    expect(page).not_to have_content 'delete'
  end

  it "should user doctor cannot destroy patient" do
    profile
    sign_in doctor
    visit send("profiles_path")

    expect(page).not_to have_content 'delete'
  end

  def sign_in(user = nil)
    visit send("new_user_session_path")
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("SIGN IN")
  end
end
