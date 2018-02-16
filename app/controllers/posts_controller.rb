class PostsController < ApplicationController
    def show 
        @post = Post.find(params[:id])
        @author = User.find(@post.user_id)
        @comment = Comment.new
        @comments = Post.find(params[:id]).comments.all
    end
    def index
        @posts = Post.all
    end
    def new
        @post = Post.new
    end
    def create
        @post = Post.new(params.require(:post).permit(:title, :content))
        @post.user_id = current_user.id
        @post.save
        redirect_to post_path(@post.id)
    end
    def edit
        @post = Post.find(params[:id])
    end
    def update
        @post = Post.find(params[:id]);
        @post.update(params.require(:post).permit(:title, :content))
        redirect_to post_path(@post.id)
    end
    def destroy
        if @post = Post.find(params[:id]);
        @post.destroy
        flash[:notice] = 'Post supprimé'
		else 
			flash[:error] = "Vous n'avez pas la permission d'effectuer cette action"
		end
        redirect_to posts_path
    end
 end
