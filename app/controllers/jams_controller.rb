class JamsController < ApplicationController


  def index
    @jam = Jam.all
  end

  def new
    @jam = Jam.new
  end

  def create
    if Jam.new(jam_params).save
      flash[:success] = 'Jam Session created!'
      redirect_to users_path
    else
      flash[:error] = 'Jam Session creation failure!'
      redirect_to new_jam_path
    end
  end

  def show
    @jam = Jam.find(params[:id])
  end

  def edit
    @jam = Jam.find(params[:id])
  end

  def update
    @jam = Jam.find(params[:id])

    if @jam.update_attributes(jam_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end









  private
  def jam_params
    params.require(:jam).permit(:location, :time)
  end
end
