class Content < ActiveRecord::Base 
  attr_accessible :content, :endpoint_id
  belongs_to :endpoint

end
