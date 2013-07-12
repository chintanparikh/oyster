class ContentsController < ApplicationController

  def create
    [:controller, :action].each do |attribute|
      params.delete attribute
    end

    token = params.delete :token
    
    endpoint = Endpoint.find_by_token(token)
    content = Content.create(endpoint_id: endpoint.id, content: params.to_json)
    render json: params.to_json
  end

end
