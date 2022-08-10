class Api::V1::UsersController < ApplicationController
  def index
    if all_users != nil && all_users != []
      render json: all_users, status: :ok, message: 'All users'
    else
      render json: { error: "No users found" }, status: :not_found
    end
  end

  def show
    if get_user_by_id
      render json: @user, status: :ok, message: 'User found'
    else 
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def create
    if User.find_by(email: params[:email])
      render json: { error: 'User already exists' }, status: :unprocessable_entity
    elsif params[:name] == nil || params[:email] == nil || params[:cpf] == nil || params[:phone] == nil
      render json: { error: 'Name, Email, Cpf and Phone is needed!' },  status: :unprocessable_entity
    else
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created, message: 'User created'
      else
        render json: { error: 'User not created, try another time' }, status: :unprocessable_entity
      end
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.email == params[:email]
      render json: { error: 'User cannot be updated because the datas is equally' }, status: :unprocessable_entity
    elsif @user.name != params[:name] && @user.email != params[:email]
      if @user.update(user_params)
        render json: @user, status: :ok, message: 'User updated'
      else
        render json: { error: 'Ocurred an error! Try other time' }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if get_user_by_id != nil
      if @user.destroy
        render json: @user, status: :ok, message: 'User deleted'
      else
        render json: { error: 'User not deleted, try another time' }, status: :unprocessable_entity
      end
    end
  end

  private

  def get_user_by_id
    @id = params[:id]
    @user = User.find_by(id: @id)
    @user
  end

  def user_params
    params.require(:user).permit(:name, :email, :cpf, :phone)
  end

  def all_users
    @users = User.all
    @users
  end

end
