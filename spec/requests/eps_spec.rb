require 'rails_helper'

RSpec.describe "Eps", type: :request do
  describe "GET /eps" do
    it "works! (now write some real specs)" do
      get eps_path
      expect(response).to have_http_status(200)
    end
  end
end
