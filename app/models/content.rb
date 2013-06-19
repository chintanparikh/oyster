class Content < ActiveRecord::Base
  attr_accessible :content
  belongs_to :endpoint
end
