class ContentsController < ApplicationController
  def create
    params.delete :controller
    params.delete :action
    endpoint_id = params.delete :endpoint_id
    content = Content.create(endpoint_id: endpoint_id, content: params.to_json)

    redirect_to Endpoint.find(endpoint_id)
  end

  def create_with_token
    params.delete :controller
    params.delete :action
    token = params.delete :token
    endpoint = Endpoint.find_by_token(token)
    content = Content.create(endpoint_id: endpoint.id, content: params.to_json)
    render json: params.to_json
  end
end
