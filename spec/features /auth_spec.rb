require "rails_helper"

feature "Sign Up" do 
  background :each do #runs this before each specific feature test 
    visit new_user_path #/users/new 
  end

  scenario "has a user sign up page" do 
    # save_and_open_page
    expect(page).to have_content("Sign Up") #case sensitive 
  end

  scenario "takes a username, password, email, age, and political affiliation" do 
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_content("Email")
    expect(page).to have_content("Age")
    expect(page).to have_content("Political Affiliation")
  end

  scenario "redirects to the user's show and displays user's username upon success" do
    #opening the headless browser and filling each input field 
    fill_in "username", with: "Capy"
    fill_in "Email", with: "Capy@aa.io"
    fill_in "Password", with: "123456"
    fill_in "Age", with: 2
    fill_in "Political Affiliation", with: "mammal"
    # save_and_open_page
    click_button "Sign Up"
    expect(page).to have_content("Capy")

    user = User.find_by(username: "Capy")
    expect(current_path).to eq(user_path(user))
  end
end