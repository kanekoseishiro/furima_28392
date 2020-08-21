FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"a1a1a1a"}
    password_confirmation {password}
    first_name            {"あ"}
    last_name             {"あ"}
    first_name_kana       {"カナ"}
    last_name_kana        {"カナ"}
    birthday              {"2000-1-1"}
  end
end