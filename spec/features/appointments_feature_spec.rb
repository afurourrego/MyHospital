require 'rails_helper'

RSpec.feature 'Appointments Feature', type: :feature do
  let(:user) { create(:user) }
  let(:administrator) { create(:administrator) }
  let(:doctor) { create(:doctor) }

  let(:profile) { create(:profile) }

  let(:appointment) { create(:appointment) }

  before do
    User.current = user
  end

  it "should user admin can create appointment" do
    doctor
    profile
    appointment
    appointment
    sign_in administrator
    visit send("appointments_path")

    expect(page).to have_content("NEW")
  end

  it "should user doctor cannot create appointment" do
    doctor
    profile
    appointment
    sign_in doctor
    visit send("appointments_path")

    expect(page).not_to have_content("NEW")
  end

  it "should user admin can update appointment" do
    doctor
    profile
    appointment
    sign_in administrator
    visit send("appointments_path")

    expect(page).to have_content("edit")
  end

  it "should user doctor can update appointment" do
    doctor
    profile
    appointment

    appointment.assistance = true
    appointment.save

    sign_in doctor
    visit send("appointments_path")

    expect(page).to have_content("edit")
  end

  it "should user admin can view appointment" do
    doctor
    profile
    appointment
    sign_in administrator

    visit send("appointment_path", id: Appointment.first.id)

    expect(page).to have_content("BACK")
  end

  it "should user doctor can view appointment" do
    doctor
    profile
    appointment

    appointment.assistance = true
    appointment.save

    sign_in doctor
    visit send("appointment_path", id: Appointment.first.id)

    expect(page).to have_content("BACK")
  end

  it "should doctor can diagnostic patient on appointment" do
    doctor
    profile
    appointment

    appointment.assistance = true
    appointment.save

    sign_in doctor
    visit send("appointment_path", id: Appointment.first.id)

    expect(page).to have_content("DIAGNOSTIC")
  end

  it "should admin cannot diagnostic patient on appointment" do
    doctor
    profile
    appointment

    sign_in administrator
    visit send("appointment_path", id: Appointment.first.id)

    expect(page).not_to have_content("DIAGNOSTIC")
  end

  it "should user doctor cannot destroy appointment" do
    doctor
    profile
    appointment

    appointment.assistance = true
    appointment.save

    sign_in doctor
    visit send("appointments_path")

    expect(page).not_to have_content 'delete'
  end

  it "should user admin cannot destroy appointment" do
    doctor
    profile
    appointment

    sign_in administrator
    visit send("appointments_path")

    expect(page).not_to have_content 'delete'
  end

  it "should user doctor cannot check appointment" do
    doctor
    profile
    appointment

    appointment.assistance = true
    appointment.save

    sign_in doctor
    visit send("appointments_path")

    expect(page).not_to have_content 'beenhere'
  end

  it "should user admin can check appointment" do
    doctor
    profile
    appointment

    sign_in administrator
    visit send("appointments_path")

    expect(page).to have_content 'beenhere'
  end

  it "should doctor can view patient on appointment" do
    doctor
    profile
    appointment

    appointment.assistance = true
    appointment.save

    sign_in doctor
    visit send("appointment_path", id: Appointment.first.id)

    expect(page).to have_content("BACK")
  end

  it "should admin can view patient on appointment" do
    doctor
    profile
    appointment

    sign_in administrator
    visit send("appointment_path", id: Appointment.first.id)

    expect(page).to have_content("BACK")
  end



  def sign_in(user = nil)
    visit send("new_user_session_path")
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("SIGN IN")
  end
end
