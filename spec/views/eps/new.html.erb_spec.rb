require 'rails_helper'

RSpec.describe "eps/new", type: :view do
  before(:each) do
    assign(:ep, Ep.new(
      :name => "MyString",
      :active => false
    ))
  end

  it "renders new ep form" do
    render

    assert_select "form[action=?][method=?]", eps_path, "post" do

      assert_select "input[name=?]", "ep[name]"

      assert_select "input[name=?]", "ep[active]"
    end
  end
end
