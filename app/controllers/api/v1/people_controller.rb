class API::V1::PeopleController < ApplicationController
  respond_to :json

  def show
    respond_with Person.find(params[:id])
  end

  def create
    person = Person.new(person_params)

    if person.save
      render json: person, status: 201, location: [:api, person]
    else
      render status: 422
    end
  end

  def update
    person = Person.find(params[:id])

    if person.update(person_params)
      render json: person, status: 200, location: [:api, person]
    else
      render status: 422
    end
  end

  def destroy
    person = Person.find(params[:id])
    person.destroy
    head 204
  end

  private

  def person_params
    params.require(:person).permit(
      :name,
      :date_of_birth,
    )
  end
end
