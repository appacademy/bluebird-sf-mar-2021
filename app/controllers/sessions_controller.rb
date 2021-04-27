class SessionsController < ApplicationController
    before_action :require_logout, only: [:new, :create]
    before_action :require_login, only: [:destroy]
    def new 
        # debugger
    end

    def create 
        # user submits username and password
        # check if user exists
        # if user exists
            # if password is correct
                # set user's session token to be in the session's session_token
        # debugger
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        # @user can be a user instance or nil
        if @user 
            login(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = ['Get out! You\'ve made mistakes.'] # customized error message
            # flash is a rails obj. It will presist for one more http request as a temporary cookie
            # we use flash instead of flash.now because we need our errors to presist to the next http request
            # render :new
            redirect_to new_session_url # redirect is a new http request (GET)
        end
    end

    def destroy
        log_out
        redirect_to new_session_url
    end
end
