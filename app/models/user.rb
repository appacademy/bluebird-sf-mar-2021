# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  username              :string           not null
#  email                 :string           not null
#  age                   :integer          not null
#  political_affiliation :string           not null
#  password_digest       :string           not null
#  session_token         :string           not null
#
class User < ApplicationRecord 
    # table names are plural, model names are singular
    validates :username, :email, :session_token, presence: true, uniqueness: true
    validates :age, :political_affiliation, :password_digest, presence: true
    validates :password, length: { minimum: 6 }, allow_nil: true
    before_validation :ensure_session_token 
    # run ensure_session_token right when .save is called
    # we can also use after_initialize | runs when .new is called

    # SPIRE => self.find_by_credentials, password/password=, is_password?, reset_session_token!, ensure_session_token
    # These methods do not change. This is how you will write them on Rails 2. KNOW THESE METHODS *HINT HINT*


    def self.find_by_credentials(username, password)
        # debugger
        user = User.find_by(username: username)

        if user && user.is_password?(password)
            return user
        else
            return nil
        end
    end
    
    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        # password_object = <BCrypt::Password> instance of Password class that inherits from BCrypt
        # BCrypt is taking existing digest and returning a BCrypt Password instance
        # debugger
        password_object.is_password?(password)
        # this is_password? is BCrypt's is_password function from Password class
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end 

    def password
        @password
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        # debugger
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        # Use save! to insure that if there is an error nothing below will run
        self.session_token
    end

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
    
    
    #Get first user record, use first
    # User.first
    # #Get last user record, use last
    # User.last
    # #Find a user that exists by id, use find
    # User.find(3)
    # #Find a user that doesn't exist by id, use find
    # User.find(200)
    # #Find a user by username, use find_by
    # User.find_by(username: 'music_for_lyfe')
    # #Find a user by username that does not exist, use find_by
    # User.find_by(username: 'cow_luva')
    # #Find all users between the ages of 10 and 20 inclusive. Show their username, and political affiliation.
    # User.where(age:10..20).select(:username, :political_affiliation)
    # #Find all users not younger than the age of 11. Use `where.not`
    # # User.where.not('age <= 11')
    # User.where.not('age <= ?',11)
    # #Find all political_affiliations of our users
    # User.select(:political_affiliation)
    # User.select(:political_affiliation).distinct
    # User.select(:political_affiliation).group(:political_affiliation)
    # #Find all users who has a political affiliation in this list and order by ascending
    
    # political_affiliations = ["Ruby", "CSS"]
    # User.where(political_affiliation: political_affiliations).order(:username)
    # User.where(political_affiliation: political_affiliations).order(username: :desc)
    # User.where(political_affiliation: political_affiliations).order(username: :asc)
end
