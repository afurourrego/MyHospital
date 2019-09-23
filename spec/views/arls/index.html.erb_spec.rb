require 'rails_helper'

RSpec.describe "arls/index", type: :view do
  before(:each) do
    assign(:arls, [
      Arl.create!(
        :name => "Name",
        :active => false
      ),
      Arl.create!(
        :name => "Name",
        :active => false
      )
    ])
  end

  it "renders a list of arls" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
