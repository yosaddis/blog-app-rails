class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new author_id: params[:author_id],
                           post_id: params[:post_id],
                           text: params[:text]

    if @comment.save
      flash[:notice] = 'Comment has been created!'
      redirect_to "/users/#{current_user.id}/posts/#{params[:post_id]}"
    else
      flash.now[:alert] = 'Comment has not been created.'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
