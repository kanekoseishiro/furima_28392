FactoryBot.define do
  factory :purchase_address do
    association :user
    association :item
    token          {"jfytd121ft"}
    postal_code    {"111-1111"}
    prefecture     {2}
    city           {"a"}
    house_number   {"1"}
    phone_number   {"1111111111"}
  end
end