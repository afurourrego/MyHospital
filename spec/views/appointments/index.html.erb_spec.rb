require 'rails_helper'

RSpec.describe "appointments/index", type: :view do
  before(:each) do
    assign(:appointments, [
      Appointment.create!(
        :creator_id => 2,
        :doctor_id => 3,
        :patient_id => 4,
        :diagnostic => "MyText",
        :assistance => false
      ),
      Appointment.create!(
        :creator_id => 2,
        :doctor_id => 3,
        :patient_id => 4,
        :diagnostic => "MyText",
        :assistance => false
      )
    ])
  end

  it "renders a list of appointments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
