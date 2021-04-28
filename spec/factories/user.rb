FactoryBot.define do #don't need to use FactoryBot. But the faker docs are fun 
  factory :user do 
    username { Faker::Movies::HarryPotter.character } #uses the faker gem for random name
    email { Faker::Internet.email }
    password { "password" }
    age { 20 }
    political_affiliation { Faker::Movies::HarryPotter.house }

    factory :harry_potter do #specific user with this specific username 
      username { "Harry Potter" }
    end
  end
end