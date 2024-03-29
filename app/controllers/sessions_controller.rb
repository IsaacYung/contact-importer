class SessionsController < ApplicationController
    before_action :block_access, except: [:destroy]

    def new
        @title = "Sign In"
    end

    def create
        @user = User.find_by(email: params[:session][:email].downcase)

        if @user && @user.authenticate(params[:session][:password])
            sign_in
            redirect_to @user
        else
            render 'new'
        end
    end

    def destroy
        sign_out
        redirect_to root_url
    end

    private
    def session_params
        params.require(:session).permit(:email, :password)
    end
end
