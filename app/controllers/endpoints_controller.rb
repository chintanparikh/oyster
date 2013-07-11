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
    show_endpoint Endpoint.find(params[:id])
  end

  def show_with_token
    show_endpoint Endpoint.find_by_token params[:token]
  end

  protected
  # DRYing up the code a little
  def show_endpoint endpoint
    @endpoint = endpoint
    @content = @endpoint.content.order("id DESC")
    render :show
  end
end
