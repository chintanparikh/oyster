class Endpoint < ActiveRecord::Base
  attr_accessible :token
  has_many :content
end
