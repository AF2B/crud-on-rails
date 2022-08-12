50.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456',
    cpf: Faker::Number.number(11),
    phone: Faker::Number.number(11)
  )
end
