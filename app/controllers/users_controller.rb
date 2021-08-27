class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authorize, only: [:create, :show, :index]

  # GET /users
  def index
    # @users = User.all

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

  # PATCH/PUT /users/1
  # def update
  #   if @user.update(user_params)
  #     render json: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :password, :password_confirmation)
    end
end