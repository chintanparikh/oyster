class EndpointsController < ApplicationController
  def index
    # Empty action/splash page with link to create a new endpoint
    @endpoint = Endpoint.new
  end

  def create
    @endpoint = Endpoint.create
    redirect_to endpoint_token_path @endpoint.token
  end

  def show
    @endpoint = Endpoint.find(params[:id])
    @content = @endpoint.order("id DESC")
  end

  def show_with_token
    @endpoint = Endpoint.find_by_token params[:token]
    @content = @endpoint.content.order("id DESC")
    render :show
  end
end
