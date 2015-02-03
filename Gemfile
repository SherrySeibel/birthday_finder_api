source "https://rubygems.org"

gem "rails", "4.2.0"
gem "rails-api"
gem "pg"

group :development, :test do
  gem "byebug"
  gem "web-console", "~> 2.0"
  gem "factory_girl_rails"
  gem "spring"
  gem "rspec-rails", "~> 3.0"
end

group :test do
  gem "capybara"
  gem "shoulda"
  gem "database_cleaner"
  gem "faker"
  gem "populator"
end

# Gems for exposing the API
gem "active_model_serializers"
gem "grape"
gem "grape-active_model_serializers"
gem "grape-swagger-rails"
gem "rack-cors", require: "rack/cors"
