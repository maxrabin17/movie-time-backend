class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create, :show, :index]

  # GET /users
  def index
    render json: User.all
  end

  # GET /users/1
  def show
    if session[:user_id]
      user = User.find(session[:user_id])
      render json: user, status: :ok
    end
  end

  # POST /users
  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :password, :password_confirmation)
    end
end