# == Schema Information
#
# Table name: chirps
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chirp < ApplicationRecord
    validates :body, presence: true 
    validate :body_too_long
    def body_too_long
        if body && body.length > 140
            errors[:body] << 'too long'
        end
    end

    # if the foreign key lives on that table it is always a belongs to

    belongs_to :author, # association name, bananable
        primary_key: :id,
        foreign_key: :author_id, # not bananable
        class_name: :User 
    # belongs_to will validate foreign key
    # if not presence: true we can add optional: true

    has_many :likes,
        primary_key: :id,
        foreign_key: :chirp_id,
        class_name: :Like

    has_many :likers,
        through: :likes,
        source: :liker
    
        
    #Find all chirps for a particular user

    #Find all chirps liked by people politically affiliated with JavaScript

    #Get only the unique values from the previous query

    #Find all chirps with no likes

    #Find how many likes each chirp has

    #Find chirps with at least 3 likes

end
