class UsersController < ApplicationController
  def index
    @users = User.first(1)
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end
end
