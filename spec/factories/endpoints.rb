# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :endpoint do
    token { Endpoint.generate_token }

    trait :with_contents do
      ignore do
        contents_count 2
      end

      before(:create) do |endpoint, eval|
        eval.contents_count.times { FactoryGirl.create(:content, endpoint: endpoint) }
      end
    end
  end
end
