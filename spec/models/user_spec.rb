require "rails_helper"

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }

  it { should have_valid(:email).when("person@something.com", "example@email.com") }
  it { should_not have_valid(:email).when(nil, "", "user", "usurper@email", "usurp.com") }
end
