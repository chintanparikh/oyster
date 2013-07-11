FactoryGirl.define do
  factory :content do
    content "{key=value}"
    association :endpoint
  end
end
