FactoryBot.define do
  factory :product do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence(20) }
    price { Faker::Number.number(3) }
    published { false }
  end

  factory :invalid_product, parent: :product do
    name { nil }
  end

  factory :udpated_product, parent: :product do
    name { Faker::Lorem.unique.word }
    description { Faker::Lorem.unique.sentence(20) }
    price { Faker::Number.unique.number(3) }
    published { true }
  end
end
