class BlogsController < ApplicationController
  def index
    @users = User.all
	end
  def show
    @user = User.find(params[:id])
	  @posts = @user.posts.all
  end
end