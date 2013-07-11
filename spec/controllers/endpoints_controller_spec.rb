require 'spec_helper'

describe EndpointsController do

  describe "#index" do
    subject { get :index }
    it { should be_successful }
  end

  describe "#create" do
    let(:params) { {} }
    subject { post :create, params }
    it "should create a new endpoint" do
      expect { subject }.to change{ Endpoint.count }.by(1)
    end
    
    it "should redirect to the correct endpoint" do
      subject.should redirect_to endpoint_token_path(assigns[:endpoint].token)
    end
  end

end
