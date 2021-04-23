class UsersController < ApplicationController
# class UserController < ApplicationController => This doesn't work
    def index
        @users = User.all

        # render json: users
        render :index
    end

    def show
        # the key of the wildcard in params, aka :id here, is however the wildcard appears in rails routes
        @user = User.find(params[:id]) #find errors out if the id is not found

        # render json: user
        render :show
    end

    def new 
        @user = User.new

        render :new
    end

    def create
        # debugger
        # User.new(
        #     username: params[:username],
        #     email: params[:email],
        #     age: params[:age],
        #     political_affiliation: params[:political_affiliation]
        # )
        # user = User.new(params[:user])

        
        @user = User.new(user_params)

        # if user.save!  this is throw an error and stop code execution when it fails
        if @user.save # this will return false if it fails
            # render json: user
            # redirect_to "/users/#{user.id}"
            redirect_to user_url(@user)
        else
            debugger
            # the errors.full_messages is from ActiveRecord using our model validations
            # render json: user.errors.full_messages, status: 422
            render :new
        end
    end

    def edit 
        @user = User.find(params[:id])

        render :edit
    end

    def update
        user = User.find_by(id: params[:id]) #find_by returns nil when not found
        if user.update(user_params)
            # redirect_to "/users/#{user.id}"
            redirect_to user_url(user)
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        # render json: "It is gone"
        redirect_to users_url
    end

    private
    # whitelisting params or strong params
    # we do this to:
    # 1. only allow the keys that we choose (a malicious user could inject their own data into the request)
    # 2. allow us to mass assign and easily add more keys
    def user_params
        params.require(:user).permit(:username, :email, :age, :political_affiliation)
        # this is saying go into params look for a key of what is in the require() method and look inside that object for the keys included in permit()
    end

end
