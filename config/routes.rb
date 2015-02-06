require "api_constraint"

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json },
    constraints: { subdomain: "api" }, path: "/"  do
    namespace :v1,
      constraints: ApiConstraint.new(version: 1, default: true) do
      resources :people, only: [:show, :create, :update, :destroy]
    end
  end
end
