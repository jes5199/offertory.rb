require 'rails_helper'

RSpec.describe ClefController, type: :controller do

  describe "GET #return" do
    it "returns http success" do
      expect(HTTParty).to receive(:post).and_return({"success":true, "access_token": "a token"})

      get :return

      expect(response).to have_http_status(:success)
    end
  end

end
