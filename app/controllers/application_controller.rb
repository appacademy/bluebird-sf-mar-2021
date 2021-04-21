class ApplicationController < ActionController::Base
    #all controller inherit from this controller
    #skips protections FOR TESTING ONLY
    skip_before_action :verify_authenticity_token

end
