FactoryBot.define do
  factory :product do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence(20) }
    price { Faker::Number.number(3) }
    published { false }
  end
end
