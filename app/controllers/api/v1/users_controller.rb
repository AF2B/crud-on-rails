class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all

    render json: @users
  end

  def show
    if @user
      render json: @user
    else
      render json: { error: 'User not found' }, status: 404
    end
  end

  def create
    @user = User.new(user_params)

    if @user
      @user.save
      render json: @user, status: 201, message: 'User created'
    else
      render json: { error: 'User not created' }, status: 422
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user
      @user.update(user_params)
      render json: @user, status: 201, message: 'User updated'
    else
      render json: { error: 'User not found' }, status: 404
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])

    if @user
      @user.destroy
      render json: { message: 'User deleted' }
    else
      render json: { error: 'User not found' }, status: 404
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    @user
  end

  def user_params
    params.require(:user).permit(:name, :email, :cpf, :phone)
  end

end
