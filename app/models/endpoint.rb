class Endpoint < ActiveRecord::Base
  attr_accessible :token
  
  # associations
  has_many :content

  # callbacks
  before_create :ensure_random_token

  # validations
  validate :token, presence: true

  def self.generate_token length=32
    SecureRandom.urlsafe_base64(length)
  end

  def ensure_random_token
    until Endpoint.find_by_token(self.token).nil? do
      self.token = Endpoint.generate_token
    end
  end
end
