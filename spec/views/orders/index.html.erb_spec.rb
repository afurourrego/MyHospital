require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :doctor_id => 2,
        :patient_id => 3,
        :appointment_id => 4,
        :type => 5,
        :description => "MyText"
      ),
      Order.create!(
        :doctor_id => 2,
        :patient_id => 3,
        :appointment_id => 4,
        :type => 5,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
