require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :doctor_id => 1,
      :patient_id => 1,
      :appointment_id => 1,
      :type => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[doctor_id]"

      assert_select "input[name=?]", "order[patient_id]"

      assert_select "input[name=?]", "order[appointment_id]"

      assert_select "input[name=?]", "order[type]"

      assert_select "textarea[name=?]", "order[description]"
    end
  end
end
