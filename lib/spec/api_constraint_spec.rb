require "rails_helper"

describe ApiConstraint do
  let(:api_constraint_v1) { ApiConstraint.new(version: 1) }
  let(:api_constraint_v2) { ApiConstraint.new(version: 2, default: true) }

  describe "matches?" do

    it "returns true when the version matches the 'Accept' header" do
      request = double(host: "api.birthday_finder_api.dev",
                       headers: {'Accept' => "application/vnd.birthday_finder_api.v1"})
      expect(api_constraint_v1.matches?(request)).to be true
    end

    it "returns the default version when 'default' option is specified" do
      request = double(host: "api.birthday_finder_api.dev")
      expect(api_constraint_v2.matches?(request)).to be true
    end
  end
end
