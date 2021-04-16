# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  username              :string           not null
#  email                 :string           not null
#  age                   :integer          not null
#  political_affiliation :string           not null
#
class User < ApplicationRecord 
    # table names are plural, model names are singular
    validates :username, :email, presence: true, uniqueness: true
    validates :age, :political_affiliation, presence: true

    has_many :chirps, # keep naming conventions semantic, 
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Chirp # class_name: 'Chirp' also works

    has_many :likes, 
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :Like

    has_many :liked_chirps,
        through: :likes,
        source: :chirp
    
     #Find all chirps for a particular user

    #Find all chirps liked by people politically affiliated with JavaScript

    #Get only the unique values from the previous query

    #Find all chirps with no likes

    #Find how many likes each chirp has

    #Find chirps with at least 3 likes


end
