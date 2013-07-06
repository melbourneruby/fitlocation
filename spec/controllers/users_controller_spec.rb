require 'spec_helper'

describe UsersController do

  describe "Get #index" do
    
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all users into @users" do
      user1, user2 = Fabricate(:user), Fabricate(:alt_user)
      get :index

      expect(assigns(:users)).to match_array([user1, user2])
    end
  end

  describe "Get #show" do
    
    before(:each) do 
      @user = Fabricate(:user)
    end
    
    it "responds successfully with an HTTP 200 status code for a valid user" do
      get :show, id: 1
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "responds unsuccessfully with an HTTP 404 status code for an invalid user" do
      get :show, id: 999999999999
      expect(response).to_not be_success
      expect(response.status).to eq(404)
    end

    it "renders the show template" do
      get :show, id: 1
      expect(response).to render_template("show")
    end
  end
end
