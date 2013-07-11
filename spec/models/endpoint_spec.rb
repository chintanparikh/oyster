require 'spec_helper'

describe Endpoint do

  # validations

  # Can't be tested because of our before_create callback
  # it { should validate_presence_of(:token) }

  # associations
  it { should have_many(:content) }

  # mass assignment
  [:token].each do |attribute|
    it {should allow_mass_assignment_of(attribute) }
  end

  describe "self.generate_token" do
    it "should generate a random token" do
      Endpoint.generate_token.should_not == Endpoint.generate_token
    end
  end

  describe "#ensure_random_token" do
    let(:endpoint_one) { FactoryGirl.create(:endpoint) }
    let(:endpoint_two) { FactoryGirl.create(:endpoint, token: endpoint_one.token) }

    it "should have generated a new token" do
      endpoint_two.token.should_not == endpoint_one.token
    end
  end
end
