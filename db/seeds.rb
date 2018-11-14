2.times do 
    user = User.create(name: Faker::FunnyName.name, email: Faker::Internet.email, password: "password")

    2.times do 
        user.posts.create(title: Faker::Lorem.sentences(1, true), body: Faker::Lorem.paragraph)
    end
end