class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    # @post = Post.includes(:author, :comments, :likes).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author_id: current_user.id, title: params[:title], text: params[:text])

    if @post.save
      flash[:notice] = 'Post has been created!'
      redirect_to user_post_path(current_user.id, @post.id)

    else
      flash.now[:alert] = 'Post has not been created.'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
