require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Identification Card/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Disability/)
    expect(rendered).to match(/MyText/)
  end
end
