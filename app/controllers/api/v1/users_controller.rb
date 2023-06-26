class Api::V1::UsersController < ApplicationController
  def index
    @users = User.includes(:reservation)
    render json: @users
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: {
        operation: 'user created successfully',
        data: {
          user_id: user.id
        }
      }, status: :created
    else
      render json: {
        operation: 'not successful',
        data: {
          errors: user.errors
        }
      }, status: :bad_request
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

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
