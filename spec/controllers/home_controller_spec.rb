require 'rails_helper'

describe HomeController do
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

end
