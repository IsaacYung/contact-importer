class UsersController < ApplicationController
    before_action :authorize, except: [:new, :create]

    def new
        @title = "Sign Up"
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to sign_in_path, notice: "Usuário foi criado com sucesso!"
        else
            render action: :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
