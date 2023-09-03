class Api::PostsController < ActionController::Base
  def index
    @posts = Post.includes(:comments).where(author_id: params[:user_id])
    render json: @posts
  end
end
