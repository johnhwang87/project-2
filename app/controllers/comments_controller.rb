class CommentsController < ApplicationController



  def new
    @comment = Comment.new
    @id = params[:id]
    puts params[:id]
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      flash[:success] = "GOOD JOB"
      redirect_to jam_path
    else
      redirect_to jam_path
    end
  end



  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to jam_path
  end


private
  def comment_params
    params.require(:comment).permit(:content, :jam_id).merge(:user_id => current_user.id)
  end


end
