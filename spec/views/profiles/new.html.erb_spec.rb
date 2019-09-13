require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      :identification_card => "MyString",
      :email => "MyString",
      :eps => 1,
      :full_name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :arl => 1,
      :rh => 1,
      :phone => 1,
      :allergies => "MyText",
      :disability => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[identification_card]"

      assert_select "input[name=?]", "profile[email]"

      assert_select "input[name=?]", "profile[eps]"

      assert_select "input[name=?]", "profile[full_name]"

      assert_select "input[name=?]", "profile[address]"

      assert_select "input[name=?]", "profile[city]"

      assert_select "input[name=?]", "profile[arl]"

      assert_select "input[name=?]", "profile[rh]"

      assert_select "input[name=?]", "profile[phone]"

      assert_select "textarea[name=?]", "profile[allergies]"

      assert_select "input[name=?]", "profile[disability]"

      assert_select "textarea[name=?]", "profile[notes]"
    end
  end
end
