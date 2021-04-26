class ApplicationController < ActionController::Base
    #all controller inherit from this controller
    #skips protections FOR TESTING ONLY
    skip_before_action :verify_authenticity_token
    helper_method :current_user, :logged_in? # this allows our views to use these methods    

    # CRRLLL => current_user, require_login, (require_logout), login, logged_in? logout
    # These methods do not change. This is how you will write them on Rails 2. KNOW THESE METHODS *HINT HINT*

    def login(user)
        # debugger
        session[:session_token] = user.reset_session_token!
    end

    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        # true or false?
        !!current_user
    end

    def log_out
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil

        # session {
        #     session_token: nil
        # }

        @current_user = nil
        # this is necessary if we are in the same controller action 
        # and doing a render instead of a redirect
    end

    def require_login
        redirect_to new_session_url unless logged_in?
    end

    def require_logout
        redirect_to users_url if logged_in?
    end
end
