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
    
        
    def self.see_chirp_authors_n_plus_1
        chirps = Chirp.all
        chirps.each do |chirp|
            puts chirp.author.username
        end 

    end 

    def self.see_chirp_authors_optimized
        chirps = Chirp.includes(:author).all
        chirps.each do |chirp|
            puts chirp.author.username
        end 
    end 

    def self.see_chirps_num_likes
        chirps = Chirp.all
        chirps.each do |chirp|
            puts chirp.likes.length
        end 
    end 

    def self.see_chirps_optimized
        chirps_with_likes = Chirp.joins(:likes).group(:id).select('chirps.*,count(*) as num_likes')
        chirps_with_likes.each do |chirp|
            puts chirp.num_likes
        end 
    end 

    #Find all chirps for a particular user
    #User.find_by(username: 'wakka_wakka').chirps
#     Chirp.joins(:author).where(users: {username: "charlos_gets_buckets"})
#     #Find all chirps liked by people politically affiliated with JavaScript
#     Chirp.joins(:likers).where('users.political_affiliation = ?', 'JavaScript')
#     #Get only the unique values from the previous query
#     Chirp.joins(:likers).where('users.political_affiliation = ?', 'JavaScript').distinct

#     #Find all chirps with no likes
#     Chirp.left_outer_joins(:likes).where(likes: {id: nil})
#     #Find how many likes each chirp has
#     Chirp.joins(:likes).group(:id).select(:id, :body, 'count(*) as num_likes')
#     #Find chirps with at least 3 likes
#     Chirp.joins(:likes).group(:id).having("count(*) >= ?", 3).pluck(:body)

#     #Find all chirps which a specific user has liked
#     Chirp.joins(:likers).where('users.username = ?', 'si_hikes')
#     Chirp.joins(likes: :liker).where(users: {username: 'si_hikes'})
#     #Find all chirps created by someone who is 11 that was also liked by someone age 11
#     Chirp.joins(:likers, :author).where(users: {age: 11}).where(authors_chirps:{age:11})
end
