class PostsController < ApplicationController

  def index
  	@current_user = User.find(session[:user_id])
  	@posts = Post.all
  end

  def create
  	new_post = Post.new(post_params)
  	new_post.user = User.find(session[:user_id])
  	# if new_post.save
  	# 	redirect_to "/the_wall"
  	# else
  	# 	flash[:error] = "Post cannot be blank!"
  	# 	redirect_to "/the_wall"
  	# end
  	flash[:error] = "Post cannot be blank!" unless new_post.save
  	redirect_to "/the_wall"
  end

  def destroy
  	Post.find(params[:id]).destroy
  	redirect_to "/the_wall"
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to "/the_wall"
  end

  def new
  end

  private

  def post_params
  	params.require(:post).permit(:post)
  end

end
