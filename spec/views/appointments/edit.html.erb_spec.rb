require 'rails_helper'

RSpec.describe "appointments/edit", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :creator_id => 1,
      :doctor_id => 1,
      :patient_id => 1,
      :diagnostic => "MyText",
      :assistance => false
    ))
  end

  it "renders the edit appointment form" do
    render

    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do

      assert_select "input[name=?]", "appointment[creator_id]"

      assert_select "input[name=?]", "appointment[doctor_id]"

      assert_select "input[name=?]", "appointment[patient_id]"

      assert_select "textarea[name=?]", "appointment[diagnostic]"

      assert_select "input[name=?]", "appointment[assistance]"
    end
  end
end
