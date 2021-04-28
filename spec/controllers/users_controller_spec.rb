require "rails_helper"

RSpec.describe UsersController, type: :controller do 
  describe "GET #new" do 
    it "renders the new user's template" do
      get :new #http get request to /users/new 
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do 
    #valid params 
    #invalid params 

    let(:user_params) do #no factorybot because we don't want an user instance 
      {
        user: {
          username: "Capy",
          email: "capy@aa.io",
          age: 2, 
          political_affiliation: "mammal",
          password: "password"
        }
      }
    end

    let(:invalid_user_params) do #no factorybot because we don't want an user instance 
          {
            user: {
              username: "Capy",
              email: "capy@aa.io",
              age: 2, 
              political_affiliation: "mammal",
              password: ""
            }
          }
    end

    context "with valid params" do 
      it "logins in the user" do 
        post :create, params: user_params #passing in user_params 
        user = User.find_by(username: "Capy")
        expect(session[:session_token]).to eq(user.session_token)
      end

      it "redirects to the user's show page" do 
        post :create, params: user_params #passing in user_params 
        user = User.find_by(username: "Capy")
        expect(response).to redirect_to(user_url(user))
                                        #helper method that takes in the user object and extracts the primary key id 
      end
    end

    context "with invalid params" do 
      it "validates presence of password and renders new template with errors" do 
        post :create, params: invalid_user_params
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present 
      end
    end
  end
end