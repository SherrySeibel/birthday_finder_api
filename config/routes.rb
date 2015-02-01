require "api_constraint"

Rails.application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
  namespace :api, defaults: { format: :json },
    constraints: { subdomain: :api }, path: "/"  do
    scope module: :v1,
      constraints: ApiConstraint.new(version: 1, default: true) do
      resources :people
    end
  end
end
