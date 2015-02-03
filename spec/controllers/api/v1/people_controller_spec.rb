require "rails_helper"

RSpec.describe API::V1::PeopleController, type: :controller do
  before(:each) {
    request.headers["Accept"] = "application/vnd.birthday_finder_api.v1"
  }

  describe "GET #show" do
    before(:each) do
      @person = FactoryGirl.create :person
      get :show, id: @person.id, format: :json
    end

    it "returns the information about a person in a hash" do
      person_response = JSON.parse(response.body, symbolize_names: true)
      expect(person_response[:name]).to eq @person.name
      expect(person_response[:date_of_birth]).to eq @person.date_of_birth
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do
    it "saves a new person to the database" do
      expect {
        post :create, person: FactoryGirl.attributes_for(:person)
      }.to change(Person, :count).by(1), format: :json
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @person = FactoryGirl.create :person
      delete :destroy, { id: @person.id }, format: :json
    end

    it { should respond_with 204 }
  end
end
