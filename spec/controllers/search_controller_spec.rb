require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  let(:params) do
    { page: 1, query: { level: ['any'], company: ['bigco'] } }
  end

  describe "GET #new" do
    it "returns http success and clears the session" do
      session[:query] = 'anything'
      get :new
      expect(response).to have_http_status :success
      expect(session[:query]).to be_empty
    end
  end

end
