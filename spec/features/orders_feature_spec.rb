require 'rails_helper'

RSpec.feature 'Appointments Feature', type: :feature do
  let(:user) { create(:user) }
  let(:administrator) { create(:administrator) }
  let(:doctor) { create(:doctor) }

  let(:profile) { create(:profile) }

  let(:appointment) { create(:appointment) }

  let(:order) { create(:order) }

  before do
    User.current = user
  end

  it "should user admin cannot create order appointment" do
    doctor
    profile
    appointment
    order
    sign_in administrator

    visit send("appointment_path", id: Appointment.first.id)

    expect(page).not_to have_content("NEW")
  end

  it "should user doctor can create order appointment" do
    doctor
    profile
    appointment
    order

    appointment.assistance = true
    appointment.save

    sign_in doctor
    visit send("appointment_path", id: Appointment.first.id)

    expect(page).to have_content("NEW")
  end

  it "should user admin can view order appointment" do
    doctor
    profile
    appointment
    order
    sign_in administrator

    visit send("appointment_order_path", appointment_id: Appointment.first.id, id: Order.first.id)

    expect(page).to have_content("BACK")
  end

  it "should user doctor can view order appointment" do
    doctor
    profile
    appointment
    order
    sign_in doctor

    visit send("appointment_order_path", appointment_id: Appointment.first.id, id: Order.first.id)

    expect(page).to have_content("BACK")
  end

  it "should user admin cannot update order appointment" do
    doctor
    profile
    appointment
    order
    sign_in administrator

    visit send("appointment_order_path", appointment_id: Appointment.first.id, id: Order.first.id)

    expect(page).not_to have_content("EDIT")
  end

  it "should user doctor can update order appointment" do
    doctor
    profile
    appointment
    order
    sign_in doctor

    visit send("appointment_order_path", appointment_id: Appointment.first.id, id: Order.first.id)

    expect(page).to have_content("EDIT")
  end

  it "should user admin cannot create order appointment" do
    doctor
    profile
    appointment
    order
    sign_in administrator

    visit send("appointment_path", id: Appointment.first.id)

    expect(page).not_to have_content("delete")
  end

  it "should user doctor cannot create order appointment" do
    doctor
    profile
    appointment
    order
    sign_in administrator

    visit send("appointment_path", id: Appointment.first.id)

    expect(page).not_to have_content("delete")
  end


  def sign_in(user = nil)
    visit send("new_user_session_path")
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("SIGN IN")
  end
end
