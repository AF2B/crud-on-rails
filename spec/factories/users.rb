FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    cpf { Faker::Number.number(digits: 11) }
    phone { Faker::Number.number(digits: 10) }
  end
end
