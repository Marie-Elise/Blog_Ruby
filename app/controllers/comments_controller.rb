class CommentsController < ApplicationController

	before_action :retrieve_informations_by_path, only: [:create, :destroy]

	def index
	end

	def create
		@comment =  @post.comments.new(comment_params)
		# specify the user_id 
		@comment.user_id = current_user.id;
		@comment.save
		flash[:notice] = 'Commentaire ajouté'
		redirect_to_post
	end


	def destroy
		@comment = Comment.find(params[:id])
		if @comment.user_id == current_user.id  || @post.user_id == current_user.id
			@comment.destroy
			flash[:notice] = 'Commentaire supprimé'
		else 
			flash[:error] = "Vous n'avez pas la permission d'effectuer cette action"
		end
		redirect_to_post
	end

	private

	def redirect_to_post
		redirect_to blog_post_path(@user.slug_blog_name, @post.slug)
	end

	def retrieve_informations_by_path
		@user =  User.find_by(slug_blog_name: params[:blog_id].downcase)
		@post = @user.posts.find_by(slug: params[:post_id])
	end 

	def comment_params
		params.require(:comment).permit(:message)
	end

end