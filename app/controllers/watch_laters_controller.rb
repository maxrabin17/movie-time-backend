class WatchLatersController < ApplicationController


    def create
        movie = WatchLater.create(watch_later_params)
        render json: movie, status: :created
    end

    def destroy
        if session[:user_id]
            watch_later = find_watch_later
            watch_later.destroy
            head :no_content
        end
    end

    def update
        watch_later = find_watch_later
        watch_later.update!(updated_params)
        watch_later.save
        render json: watch_later, status: :accepted
    end

    private

    def watch_later_params
        params.permit(:title, :poster, :user_id)
    end

    def updated_params
        params.permit(:comment)
    end

    def find_watch_later
        WatchLater.find(params[:id])
    end
end
