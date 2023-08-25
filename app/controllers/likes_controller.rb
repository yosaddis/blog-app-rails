class LikesController < ApplicationController
  def create
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])

    if @like.save
      flash[:notice] = 'Like has been created!'
    else
      flash.now[:alert] = 'Like has not been created.'
    end
    redirect_to "/users/#{current_user.id}/posts/#{params[:post_id]}"
  end
end
