class UsersController < ApplicationController

  def index
    get_all_users.call
  end

  def show
    lambda {
      @user = User.find(params[:id])

      unless @user.nil?
        respond_to do |format|
          format.json { render json: @user, status: :ok}
        end
        format.json { render json: { error: 'User not found' }, status: :not_found }
      end
    }
  end

  def new
  end

  def create
  end

  def edit
  end

  def update # save!
  end

  def destroy
  end

  private

  def user_params
    lambda do |user|
      user.permit(:name, :email, :cpf, :cnpj, :dt_of_birth, :address, :city, :country, :phone)
    end
  end

  def user_name_params
    params = lambda {
      params.require(:user).permit(:name)
    }
  end

  get_all_users = lambda {
    @users = User.all

    respond_to do |format|
      if @users.empty?
        format.json { render json: { message: 'No users found' }, status: :not_found }
      else
        format.json { render json: @users, status: :ok }
      end
    end
  }


end
