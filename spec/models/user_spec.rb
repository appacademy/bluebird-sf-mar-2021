require "rails_helper"

RSpec.describe User, type: :model do 
  #testing a user model 

  let(:incomplete_user) { User.new(username: "", email: "incomplete@appacademy.io", password: "password", political_affiliation: "Ruby", age: 26)}

  it "validates presence of an username" do 
    expect(incomplete_user).to_not be_valid #expecting this to be an invalid user 
  end

  #shoulda matchers give us one-liners with better descriptions 
  #no need to create a test object 
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  #unique validation 
  #here we do need create an object- shoulda matchers will attempt to recreate this 
  subject(:capy) { User.create(
    username: "Capy",
    email: "capy@aa.io",
    age: 2, 
    political_affiliation: "mammal",
    password: "password"
  )}

  it { should validate_uniqueness_of(:username) } 
  #can do this for email as well 

  #FactoryBot usage: build (aka .new), create 
  describe "#session_token" do 
    it "assigns a session_token if none given" do 
      #expect(FactoryBot.build(:user).session_token).not_to be_nil
      expect(FactoryBot.create(:user).session_token).not_to be_nil
    end 
  end 

  #shoulda matchers can check for associations
  #GIVES YOU THE NAME OF THE ASSOCIATION WE ARE CHECKING FOR *cough cough
  it { should have_many(:chirps) } 

  describe "password encryption" do 
    it "does not save passwords to the database" do 
      # FactoryBot.create(:user, username: 'Harry Potter') 
      FactoryBot.create(:harry_potter)
      user = User.find_by(username: "Harry Potter")
      expect(user.password).not_to eq("password")
    end

    it "encrypts password using BCrypt" do 
      expect(BCrypt::Password).to receive(:create).with("123456")
      FactoryBot.build(:user, password: "123456")
      #we gave it a specific pw; overrides the FactoryBot password of "password" 
    end
  end
end