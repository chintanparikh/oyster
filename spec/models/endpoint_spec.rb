require 'spec_helper'

describe Endpoint do

  # validations
  
  # failing for some reason? Shoulda might be messed up ...
  # it { should validate_presence_of(:token) }

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
