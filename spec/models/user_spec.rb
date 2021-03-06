require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:administrator) { create(:administrator) }
  let(:doctor) { create(:doctor) }

  before do
    User.current = user
    # @user1 = create(:user)
  end

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "has a unique email" do
    user2 = build(:user, email: user.email)
    expect(user2).to_not be_valid
  end

  it "is not valid without a password" do
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without an email" do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end

  it "role cannot be blank on create" do
    new_user = User.new
    new_user.email = 'new_user@myhospital.com'
    new_user.password = 123456
    new_user.save
    expect(new_user.errors.messages[:role]).to eq []
  end

end
