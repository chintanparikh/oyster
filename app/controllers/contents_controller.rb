class ContentsController < ApplicationController

  def create
    [:controller, :action, :token].each do |attribute|
      params.delete attribute
    end
    
    endpoint = Endpoint.find_by_token(token)
    content = Content.create(endpoint_id: endpoint.id, content: params.to_json)
    render json: params.to_json
  end

end
