class JamsController < ApplicationController

@@descending = false

  def index
    @jams = Jam.all
  end

  def new
    @jam = Jam.new
  end

  def create
    if Jam.new(jam_params).save
      flash[:success] = 'Jam Session created!'
      redirect_to user_path(current_user.id)
    else
      flash[:error] = 'Jam Session creation failure!'
      redirect_to new_jam_path
    end
  end


    def sort
      if @@descending
        @jams = Jam.order(params[:sort_by] + ' DESC')
      else
        @jams = Jam.order(params[:sort_by])
      end
      @@descending = !@@descending
      render :search
    end

  def search
    if params[:query]
        search_by = params[:search].to_sym
        query = params[:query]
        jam_list = Jam.all
        @jams = []
        jam_list.each do |jam|
          if jam[search_by].downcase.include? params[:query].downcase
                @jams << jam
                end
            end
            return @jams
        else
        @jams = Jam.all
      end
    end

  def show
    @jam = Jam.find(params[:id])
    @image = @jam.user
    @comments = @jam.comments.all.sort
  end

  def edit
    @jam = Jam.find(params[:id])
  end

  def update
    @jam = Jam.find(params[:id])

    if @jam.update_attributes(jam_params)
      redirect_to jam_path
    else
      render :edit
    end
  end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def destroy
    @jam = Jam.find(params[:id])
    @jam.destroy
    redirect_to user_path(current_user.id)
  end





  private
  def jam_params
    params.require(:jam).permit(:description, :date, :seeking, :location, :time).merge(:user_id => current_user.id)
  end
end
