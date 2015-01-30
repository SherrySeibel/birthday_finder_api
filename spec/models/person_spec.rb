require "rails_helper"

RSpec.describe Person, type: :model do
  let(:person) { FactoryGirl.build :person }
  subject { person }

  it { should validate_presence_of(:name) }
  it { should_not allow_value("", nil).for(:name) }

  it { should validate_presence_of(:date_of_birth) }
  it { should_not allow_value("", nil).for(:date_of_birth) }
end
