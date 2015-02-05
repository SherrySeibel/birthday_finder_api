require "rails_helper"

describe Api::V1::UsersController do
  before(:each) { request.headers['Accept'] = "application/vnd.birthday_finder_api.v1" }

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, id: @user.id, format: :json
    end

    it "returns the information about a user in a hash" do
      user_response = json_response
      expect(user_response[:email]).to eq @user.email
    end

    it { should respond_with 200 }
  end

  context "when is not created" do
    before(:each) do
      @invalid_user_attributes = { password: "12345678",
                                   password_confirmation: "12345678" }
      post :create, { user: @invalid_user_attributes }, format: :json
    end

    it "renders an errors json" do
      user_response = json_response
      expect(user_response).to have_key(:errors)
    end

    it "renders the json errors on why the user could not be created" do
      user_response = json_response
      expect(user_response[:errors][:email]).to include "can't be blank"
    end

    it { should respond_with 422 }
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @user = FactoryGirl.create :user
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, { id: @user.id, user: { email: "newmail@example.com" } },
          format: :json
      end

      it "renders the json representation for the updated user" do
        user_response = json_response
        expect(user_response[:email]).to eq "newmail@example.com"
      end

      it { should respond_with 200 }
    end

    context "when is not created" do
      before(:each) do
        patch :update, { id: @user.id, user: { email: "bademail.com" } },
          format: :json
      end

      it "renders an errors json" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include "is invalid"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @user = FactoryGirl.create :user
      delete :destroy, { id: @user.id }, format: :json
    end

    it { should respond_with 204 }
  end
end
