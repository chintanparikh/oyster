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

  describe "#show" do
    let(:endpoint) { FactoryGirl.create(:endpoint, :with_contents) }
    let(:params) { {id: endpoint.id} }
    subject { get :show, params }

    it "should get the correct endpoint" do
      subject
      assigns[:endpoint].should == endpoint
    end

    it "should get the content" do
      subject
      assigns[:content].sort.should == endpoint.content.sort
    end

    it "should render the correct template" do
      subject
      response.should render_template(:show)
    end
  end

  describe "#show_with_token" do
    let(:endpoint) { FactoryGirl.create(:endpoint, :with_contents) }
    let(:params) { {token: endpoint.token} }
    subject { get :show_with_token, params }

    it "should get the correct endpoint" do
      subject
      assigns[:endpoint].should == endpoint
    end

    it "should get the content" do
      subject
      assigns[:content].sort.should == endpoint.content.sort
    end

    it "should render the correct template" do
      subject
      response.should render_template(:show)
    end
  end


end
