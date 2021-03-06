# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Chirp.destroy_all
Like.destroy_all
#Instructors 
ryan = User.create!(username: "will_climb_rocks", age: 11, political_affiliation: "JavaScript", email: "arms@aa.io", password: "123456")
charlos = User.create!(username: "charlos_gets_buckets", age: 11, political_affiliation: "JavaScript", email: "ballin@aa.io", password: "123456")
lina = User.create!(username: "lina_2020", age: 11, political_affiliation: "Ruby", email: "good_speeches@aa.io", password: "123456")
erik = User.create!(username: "hawaiian_shirts_ftw", age: 11, political_affiliation: "JavaScript", email:"valhalla@aa.io", password: "123456")
zack = User.create!(username: "music_for_lyfe", age: 11, political_affiliation: "Python", email:"musicmaster@aa.io", password: "123456")
julia = User.create!(username: "give_me_wine", age: 11, political_affiliation: "JavaScript", email:"might_cry@aa.io", password: "123456")
dean = User.create!(username: "dean_machine", age: 11, political_affiliation: "Ruby", email: "deans_diary@aa.io", password: "123456")
angela = User.create!(username: "loves_capy", age: 11, political_affiliation: "JavaScript", email: "chosenone@aa.io", password: "123456")
walker = User.create!(username: "wakka_wakka", age: 11, political_affiliation: "JavaScript", email: "wakka@wakka.walking", password: "123456")
mike = User.create!(username: "like_mike", age: 11, political_affiliation: "Ruby", email: "mike@aa.io", password: "123456")
vanessa = User.create!(username: "the_vanessa", age: 11, political_affiliation: "Ruby", email: "vanessa@aa.io", password: "123456")
spencer = User.create!(username: "si_hikes", age: 11, political_affiliation: "CSS", email:"best_hikes@aa.io", password: "123456")
diego = User.create!(username: "pooch_app", age: 11, political_affiliation: "JavaScript", email: "pooch@aa.io", password: "123456")
big_company = User.create!(username: "instructors_rock", age: 52, political_affiliation: "Instructors", email: "giveus@money.now", password: "123456")
#chirps
chirp1 = Chirp.create!(author_id: charlos.id, body: "Buckets!!!")
chirp2 = Chirp.create!(author_id: big_company.id, body: "Hello fellow instructors.")
chirp3 = Chirp.create!(author_id: big_company.id, body: "Have you seen this sweet instructor merch?")
chirp4 = Chirp.create!(author_id: zack.id, body: "Zooommm!!!!")
chirp5 = Chirp.create!(author_id: diego.id, body: "Kahoots are an opportunity to mess with students.")
chirp6 = Chirp.create!(author_id: julia.id, body: "No. Ryan. No.")
chirp7 = Chirp.create!(author_id: lina.id, body: "This is a random quote I found online. -Some person, 2020.")
chirp8 = Chirp.create!(author_id: erik.id, body: "You can also check out my sweet game. It was made with JavaScript.")
chirp9 = Chirp.create!(author_id: zack.id, body: "Python is the best coding language.")
chirp10 = Chirp.create!(author_id: spencer.id, body: "Programmer: A machine that turns coffee into code.")
chirp11 = Chirp.create!(author_id: big_company.id, body: "You're a wizard, instructor.")
# Likes
  # zack
  Like.create!(liker_id: zack.id, chirp_id: chirp4.id)
  Like.create!(liker_id: zack.id, chirp_id: chirp5.id)
  Like.create!(liker_id: zack.id, chirp_id: chirp6.id)
  Like.create!(liker_id: zack.id, chirp_id: chirp7.id)
  Like.create!(liker_id: zack.id, chirp_id: chirp8.id)
  Like.create!(liker_id: zack.id, chirp_id: chirp9.id)
  Like.create!(liker_id: zack.id, chirp_id: chirp10.id)
  # spencer
  Like.create!(liker_id: spencer.id, chirp_id: chirp6.id)
  Like.create!(liker_id: spencer.id, chirp_id: chirp7.id)
  Like.create!(liker_id: spencer.id, chirp_id: chirp8.id)
  Like.create!(liker_id: spencer.id, chirp_id: chirp9.id)
  Like.create!(liker_id: spencer.id, chirp_id: chirp4.id)
  Like.create!(liker_id: spencer.id, chirp_id: chirp10.id)
  # charlos
  Like.create!(liker_id: charlos.id, chirp_id: chirp4.id)
  Like.create!(liker_id: charlos.id, chirp_id: chirp5.id)
  Like.create!(liker_id: charlos.id, chirp_id: chirp6.id)
  # erik
  Like.create!(liker_id: erik.id, chirp_id: chirp5.id)
  Like.create!(liker_id: erik.id, chirp_id: chirp6.id)
  Like.create!(liker_id: erik.id, chirp_id: chirp10.id)
  # Big Company
  Like.create!(liker_id: big_company.id, chirp_id: chirp1.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp4.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp5.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp6.id)
  #diego
  Like.create!(liker_id: diego.id, chirp_id: chirp7.id)
  Like.create!(liker_id: diego.id, chirp_id: chirp8.id)
  Like.create!(liker_id: diego.id, chirp_id: chirp9.id)
  Like.create!(liker_id: diego.id, chirp_id: chirp10.id)