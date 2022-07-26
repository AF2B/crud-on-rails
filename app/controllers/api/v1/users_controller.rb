class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.json { render: json => @user, status: :ok!, notice: 'Usuário criado com sucesso!' }
      else
        format.json { render: json => @user.params, notice: 'Erro ao criar usuário! Verifique os dados necessários!' }
      end
    end
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.json { render: json => @user, status: :ok, notice: 'Usuário atualizado com sucesso!' }
      else
        format.json { render: json => @user, status: :ok, notice: 'Ocorreu uma falha ao atualizar o usuário!' }
      end
    end
  end

  def edit
    # TODO
  end

  def destroy
    @user = User.find(params[:id])
      if @user == User.find(params[:id])
        @user.destroy
        respond_to do |format|
          format.json { render: json => @user, status: :ok, notice: 'Usuário excluído com sucesso!' }
        else
          format.json { render: json => @user.params, notice: 'Ocorreu um erro ao excluir o usuário!' }
        end
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :dt_of_birth, :cpf, :rg, :address, :city, :state, :phone)
  end

  def user_id
    params[:id]
  end

  def user_cpf_isValid?
    # TODO
  end

  def user_name_isValid?
    # TODO
  end
end