require 'rails_helper'

RSpec.describe "arls/new", type: :view do
  before(:each) do
    assign(:arl, Arl.new(
      :name => "MyString",
      :active => false
    ))
  end

  it "renders new arl form" do
    render

    assert_select "form[action=?][method=?]", arls_path, "post" do

      assert_select "input[name=?]", "arl[name]"

      assert_select "input[name=?]", "arl[active]"
    end
  end
end
