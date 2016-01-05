class UsersController < ApplicationController

    def index
    end

    def search
    if params[:query]
        search_by = params[:search].to_sym
        query = params[:query]
        user_list = User.all
        @users = []
        user_list.each do |user|
          if user[search_by].downcase.include? params[:query].downcase
                @users << user
            end
        end
        return @users
    else
    @users = User.all
  end
    end



    def show
      @user = User.find(params[:id])
      @jam = Jam.new
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

    def edit
       @user = User.find(params[:id])
    end


    def update
      @user = User.find(params[:id])

      if @user.update_attributes(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    end

    def new
      @user = User.new
    end

  def sort
    if @@descending
      @users = User.order(params[:sort_by] + ' DESC')
    else
    @users = User.order(params[:sort_by])
  end
    @@descending = !@@descending
    render :index
  end



    private
    def user_params
      params.require(:user).permit(:email, :password, :name, :age, :influences, :talent, :experience, :location, :image, :password_confirmation)
    end
end
