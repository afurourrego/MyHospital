require 'rails_helper'

RSpec.describe "eps/show", type: :view do
  before(:each) do
    @ep = assign(:ep, Ep.create!(
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
