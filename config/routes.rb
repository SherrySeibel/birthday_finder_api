require "monban/constraints/signed_in"
require "api_constraint"

Rails.application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
  # resource :session, only: [:new, :create, :destroy]
  namespace :api, defaults: { format: :json },
    constraints: { subdomain: :api }, path: "/"  do
    scope module: :v1,
      constraints: ApiConstraint.new(version: 1, default: true) do
      resources :users, only: [:show]
    end
  end
end
