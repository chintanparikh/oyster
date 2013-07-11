# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :endpoint do
    token { Endpoint.generate_token }

    trait :with_contents do
      ignore do
        contents_count 2
      end

      after_create do |endpoint|
        contents_count.times do { FactoryGirl.create(:contents, endpoint: endpoint) }
      end
    end
  end
end
