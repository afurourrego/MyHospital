require 'rails_helper'

RSpec.describe "arls/show", type: :view do
  before(:each) do
    @arl = assign(:arl, Arl.create!(
      :name => "Name",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
  end
end
