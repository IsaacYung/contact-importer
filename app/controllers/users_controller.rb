class UsersController < ApplicationController
    before_action :authorize, except: [:new, :create]

    def new
        @title = "Sign Up"
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to sign_in_path, notice: "User created successfully!"
        else
            render action: :new
        end
    end

    def show
        @offset = params[:offset].to_i
        @offset = 0 if @offset < 0

        @user = User.find(params[:id])
        @contacts = @user.contacts.limit(6).offset(@offset || 0)
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
