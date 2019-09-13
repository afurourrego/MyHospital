require 'rails_helper'

RSpec.describe "eps/edit", type: :view do
  before(:each) do
    @ep = assign(:ep, Ep.create!(
      :name => "MyString",
      :active => false
    ))
  end

  it "renders the edit ep form" do
    render

    assert_select "form[action=?][method=?]", ep_path(@ep), "post" do

      assert_select "input[name=?]", "ep[name]"

      assert_select "input[name=?]", "ep[active]"
    end
  end
end
