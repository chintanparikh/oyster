# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :endpoint do
    token { Endpoint.generate_token }
  end
end
