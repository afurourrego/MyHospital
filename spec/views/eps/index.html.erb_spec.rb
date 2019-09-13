require 'rails_helper'

RSpec.describe "eps/index", type: :view do
  before(:each) do
    assign(:eps, [
      Ep.create!(
        :name => "Name",
        :active => false
      ),
      Ep.create!(
        :name => "Name",
        :active => false
      )
    ])
  end

  it "renders a list of eps" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
