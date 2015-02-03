require "rails_helper"

RSpec.describe Person, type: :model do
  it "should have a factory" do
    expect(FactoryGirl.build(:person)).to be_valid
  end

  let(:person) { FactoryGirl.build :person }
  subject { person }

  it { should validate_presence_of(:name) }
  it { should_not allow_value("", nil).for(:name) }

  it { should validate_presence_of(:date_of_birth) }
  it { should_not allow_value("", nil).for(:date_of_birth) }
end
