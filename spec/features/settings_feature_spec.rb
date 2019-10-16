require 'rails_helper'

RSpec.feature 'Settings Feature', type: :feature do
  let(:user) { create(:user) }
  let(:administrator) { create(:administrator) }
  let(:doctor) { create(:doctor) }

  before do
    User.current = user
  end

  it "should user admin create eps" do
    sign_in user

    visit send("settings_path")
    all(".btn_link_to", text: "NEW")[0].click
    fill_in "Name", with: "coosalud"
    find(".check_box_forms").click

    click_button("SAVE")
    expect(page).to have_content("Coosalud")
  end

  it "should user admin create arl" do
    sign_in user

    visit send("settings_path")
    all(".btn_link_to", text: "NEW")[1].click
    fill_in "Name", with: "coosalud"
    find(".check_box_forms").click

    click_button("SAVE")
    expect(page).to have_content("Coosalud")
  end

  it "should canot create eps if no login" do
    visit send("settings_path")
    expect(page).to have_content("Log In")
  end

  it "should user admin search eps" do
    sign_in user

    visit send("settings_path")
    all(".btn_link_to", text: "NEW")[0].click
    fill_in "Name", with: "coosalud"
    find(".check_box_forms").click

    click_button("SAVE")

    all(".btn_link_to", text: "NEW")[0].click
    fill_in "Name", with: "sanitas"
    find(".check_box_forms").click

    click_button("SAVE")

    expect(page).to have_content("Coosalud")
    expect(page).to have_content("Sanitas")

    fill_in "name_eps", with: "coosalud"
    all(".button_search")[0].click

    expect(page).to have_content("Coosalud")
    expect(page).not_to have_content("Sanitas")
  end

  it "should user admin search arl" do
    sign_in user

    visit send("settings_path")
    all(".btn_link_to", text: "NEW")[1].click
    fill_in "Name", with: "coosalud"
    find(".check_box_forms").click

    click_button("SAVE")

    all(".btn_link_to", text: "NEW")[1].click
    fill_in "Name", with: "sanitas"
    find(".check_box_forms").click

    click_button("SAVE")

    expect(page).to have_content("Coosalud")
    expect(page).to have_content("Sanitas")

    fill_in "name_eps", with: "coosalud"
    all(".button_search")[1].click

    expect(page).to have_content("Coosalud")
    expect(page).to have_content("Sanitas")
  end

  it "should user admin edit eps" do
    sign_in user

    visit send("settings_path")
    all(".btn_link_to", text: "NEW")[0].click
    fill_in "Name", with: "coosalud"
    find(".check_box_forms").click

    click_button("SAVE")
    expect(page).to have_content("Coosalud")

    visit send("edit_ep_path", id: Ep.first.id)
    fill_in "Name", with: "sanitas"
    click_button("SAVE")

    expect(page).not_to have_content("Coosalud")
    expect(page).to have_content("Sanitas")
  end

  it "should user admin edit arl" do
    sign_in user

    visit send("settings_path")
    all(".btn_link_to", text: "NEW")[1].click
    fill_in "Name", with: "coosalud"
    find(".check_box_forms").click

    click_button("SAVE")
    expect(page).to have_content("Coosalud")

    visit send("edit_arl_path", id: Arl.first.id)
    fill_in "Name", with: "sanitas"
    click_button("SAVE")

    expect(page).not_to have_content("Coosalud")
    expect(page).to have_content("Sanitas")
  end



  def sign_in(user = nil)
    visit send("new_user_session_path")
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("SIGN IN")
  end
end
