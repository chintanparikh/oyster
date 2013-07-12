class EndpointsController < ApplicationController
  def index
    # Empty action/splash page with link to create a new endpoint
    @endpoint = Endpoint.new
  end

  def create
    @endpoint = Endpoint.create(token: Endpoint.generate_token)
    redirect_to endpoint_token_path @endpoint.token
  end

  def show
    show_endpoint Endpoint.find(params[:id])
  end

  def show_with_token
    show_endpoint Endpoint.find_by_token params[:token]
  end

  def new_content
    @endpoint = Endpoint.find(params[:endpoint_id])
    last_content = @endpoint.content.last

    if last_content.id <= params[:last_content_id].to_i
      new_content = {content: nil}
    else
      content = @endpoint.content.where("id > #{params[:last_content_id]}")
      #new_content looks like
      # { content: 
      #   {
      #     5: "{key: value}",
      #     7: "{another_key: another_value}"      
      #   }
      # }
      new_content = {content: Hash[content.collect { |v| [v.id, v.content] }]}
    end

    render json: new_content.to_json
  end

  protected
  # DRYing up the code a little
  def show_endpoint endpoint
    @endpoint = endpoint
    @content = @endpoint.content.order("id DESC")
    render :show
  end
end
