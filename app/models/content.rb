class Content < ActiveRecord::Base 
  attr_accessible :content, :endpoint_id

  # associations
  belongs_to :endpoint
end
