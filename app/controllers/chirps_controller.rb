class ChirpsController < ApplicationController
    
    def index
        # user = User.includes(:chirps).find_by(id: params[:user_id])
        chirps = Chirp.where(author_id: params[:user_id])

        # render json: user.chirps
        render json: chirps
        # both ways will get us all the chirps for a specific user
    end
    # however the wildcard appears in your rails routes is how the key will be in params

    def show
        chirp = Chirp.find_by(id: params[:id])

        render json: chirp
    end

end
