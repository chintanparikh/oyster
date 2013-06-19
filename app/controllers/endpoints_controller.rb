class EndpointsController < ApplicationController
  def index
    # Empty action/splash page with link to create a new endpoint
  end

  def create
    @endpoint = Endpoint.create
    redirect_to @endpoint
  end

  def show
    @endpoint = Endpoint.find(params[:id])
  end

  def destroy
  end
end
