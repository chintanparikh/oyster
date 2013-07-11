require 'spec_helper'

describe ContentsController do
  describe "#create" do
    let(:endpoint) { FactoryGirl.create(:endpoint) }
    let(:params) { {key: "someValue", another_key: "another_value", controller: "contents", action: "create", token: endpoint.token} }
    subject { post :create, params }

    it "should create a new Content" do
      expect { subject }.to change{ Content.count }.by(1)
    end

    it { should be_successful }

    it "should return the data that was POSTed" do
      subject
      response.body.should == "{\"key\":\"someValue\",\"another_key\":\"another_value\"}"
    end

  end

end
