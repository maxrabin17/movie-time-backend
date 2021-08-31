class WatchLatersController < ApplicationController


    def create
        # byebug
        movie = WatchLater.create(watch_later_params)
        # if movie.save!
            render json: movie, status: :created
        # end
    end

    def destroy
        if session[:user_id]
            watch_later = find_watch_later
            watch_later.destroy
            head :no_content
        end
    end

    private

    def watch_later_params
        params.permit(:title, :poster, :user_id)
    end

    def find_watch_later
        WatchLater.find(params[:id])
    end
end
