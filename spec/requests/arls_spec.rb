require 'rails_helper'

RSpec.describe "Arls", type: :request do
  describe "GET /arls" do
    it "works! (now write some real specs)" do
      get arls_path
      expect(response).to have_http_status(200)
    end
  end
end
