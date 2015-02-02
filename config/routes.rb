require "api_constraint"

Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json },
    constraints: { subdomain: :api }, path: "/"  do
    scope module: :v1,
      constraints: ApiConstraint.new(version: 1, default: true) do
      resources :users, only: [:show, :create, :update, :destroy]
      resources :people, only: [:show, :create, :update, :destroy]
    end
  end
end
