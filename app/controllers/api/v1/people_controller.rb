class API::V1::PeopleController < ApplicationController
  def index
    @people = Person.all
    respond_to do |format|
      format.json { render json: @people }
    end
  end
end
