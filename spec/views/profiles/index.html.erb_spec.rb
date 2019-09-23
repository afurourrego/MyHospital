require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :identification_card => "Identification Card",
        :email => "Email",
        :eps => 2,
        :full_name => "Full Name",
        :address => "Address",
        :city => "City",
        :arl => 3,
        :rh => 4,
        :phone => 5,
        :allergies => "MyText",
        :disability => "Disability",
        :notes => "MyText"
      ),
      Profile.create!(
        :identification_card => "Identification Card",
        :email => "Email",
        :eps => 2,
        :full_name => "Full Name",
        :address => "Address",
        :city => "City",
        :arl => 3,
        :rh => 4,
        :phone => 5,
        :allergies => "MyText",
        :disability => "Disability",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "Identification Card".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Disability".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
