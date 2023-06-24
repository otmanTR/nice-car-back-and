class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end
  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end
  def auto_login
    render json: @user
  end
  private
  def user_params
    params.permit(:username, :password)
  end
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
