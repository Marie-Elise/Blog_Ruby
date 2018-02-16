class CommentsController < ApplicationController
    def create
        @comment =  Post.find(params[:post_id]).comments.new(comment_params)
		@comment.user_id = current_user.id;
		@comment.save
		redirect_to posts_path
    end
    def index
        @comment = Comment.all
    end
    def show
        @comments = Post.find(params[:post_id]).comments.all
    end
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to posts_path
    end
    def comment_params
        params.require(:comment).permit(:message)
    end
end