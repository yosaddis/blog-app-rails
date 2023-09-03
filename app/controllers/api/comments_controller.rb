class Api::CommentsController < ActionController::Base
    skip_before_action :verify_authenticity_token
    def index
        @comments = Comment.where(post_id: params[:post_id])
        render json: @comments
    end
    def create
        message = 'Verify Credentials'
        @user = User.find_by_id(params[:user_id])
        if @user.present?
            @post = Post.find_by_id(params[:post_id])
            if @post.present?
                @comment = Comment.new(author: @user, post: @post, text: params[:text])
                message = if @comment.save
                    'comment created'
                else
                    'comment not created'
                end
            else
                message = 'Post not found'
            end
        else
            message = 'user not found'
        end
        render json: {message:}
    end
end