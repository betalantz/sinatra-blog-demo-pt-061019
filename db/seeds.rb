2.times do 
    User.create(name: Faker::FunnyName.name, email: Faker::Internet.email)
end