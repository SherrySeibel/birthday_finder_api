class API::V1::People < ApplicationController
  module API
    module V1
      class People < Grape::API
        include API::V1::Defaults

        resource :people do
          desc "Return all people"
          get "", root: :people do
            Person.all
          end

          desc "Return a person"
          params do
            requires :id, type: String, desc: "ID of the contact"
          end
          get ":id", root: "person" do
            Person.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end
end
