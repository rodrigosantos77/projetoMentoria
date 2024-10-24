class UsersController < ApplicationController

#lista de todos os usuarios
def index
   @users = User.all 
end


#exibição do formulario de criacao de um novo usuario
def new
    @user = User.new
end


#criacao de um novo usuario
def create
  @user = User.new(user_params)
  if @user.save
    redirect_to users_path, notice: "usuario criado com sucesso!"
  else 
   render :new, status: :unprocessable_etity
  end
end

#exibição do formulario de edicao de um usuario existente
def edit
    @user = User.find(params[:id])
end


# Atualiza um usuário existente
def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "Usuário atualizado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end


  # Exclui um usuário
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "Usuário excluído com sucesso!"
  end

  private

  # Método privado para permitir os parâmetros do usuário
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
