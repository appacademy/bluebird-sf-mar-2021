class SessionsController < ApplicationController
    before_action :require_logout, only: [:new, :create]
    before_action :require_login, only: [:destroy]
    def new 

    end

    def create 
        # user submits username and password
        # check if user exists
        # if user exists
            # if password is correct
                # set user's session token to be in the session's session_token

        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user 
            login(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def destroy
        log_out
        redirect_to new_session_url
    end
end
