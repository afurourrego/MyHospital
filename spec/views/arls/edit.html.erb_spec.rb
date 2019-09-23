require 'rails_helper'

RSpec.describe "arls/edit", type: :view do
  before(:each) do
    @arl = assign(:arl, Arl.create!(
      :name => "MyString",
      :active => false
    ))
  end

  it "renders the edit arl form" do
    render

    assert_select "form[action=?][method=?]", arl_path(@arl), "post" do

      assert_select "input[name=?]", "arl[name]"

      assert_select "input[name=?]", "arl[active]"
    end
  end
end
