class UsersController < ApplicationController

    def index
    end


    def new
      @user = User.new
    end


    def create
      if User.new(user_params).save
        flash[:success] = 'You are registered!'
        redirect_to users_path
      else
        flash[:error] = 'Registration has failed!'
        redirect_to new_user_path
      end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
