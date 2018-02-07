class BlogsController < ApplicationController
  def index
    @users = User.all
	end
  def show
	  @posts = @user.post.all
  end

end