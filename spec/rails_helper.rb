ENV["RAILS_ENV"] ||= "test"
require "spec_helper"
require "capybara/rspec"
require File.expand_path("../../config/environment", __FILE__)
require "valid_attribute"
require "rspec/rails"
include FactoryGirl::Syntax::Default
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
end
