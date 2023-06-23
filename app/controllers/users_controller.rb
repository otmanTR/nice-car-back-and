class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
    print @users
  end

  def create
    user = User.new(user_params)
    if user.save
      token = issue_token(user)
      render json: { user: UserSerializer.new(user), jwt: token }
    elsif user.errors.messages
      render json: { error: user.errors.messages }
    else
      render json: { error: 'User could not be created. Please try again.' }
    end
  end

  def register
    if User.find_by(user_params).nil?
      @user = User.new(user_params)
      if @user.save
        render json: { status: 'SUCCESS', message: 'User created', data: @user }, status: :ok
      else
        render json: { status: 'ERROR', message: 'User not created', data: @user.errors },
               status: :unprocessable_entity
      end
    else
      render json: { status: 'ERROR', message: 'User already exists' }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(user_params)
    if @user.nil?
      render json: { status: 'ERROR', message: 'User not found' }, status: :unprocessable_entity
    else
      render json: { status: 'SUCCESS', message: 'User logged in', data: @user }, status: :ok
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
