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

  describe "POST #create" do
    it "returns http success" do
      post :create, params
      expect(response).to have_http_status :success
    end

    it "sets the session query" do
      session[:query] = {}
      post :create, params
      expect(session[:query]).to eq params[:query]
    end
  end

end
