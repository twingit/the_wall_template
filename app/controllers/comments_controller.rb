class CommentsController < ApplicationController

	def create
		new_comment = Comment.new(comment_params)
		new_comment.user = User.find(session[:user_id])
		# if new_comment.save
		# 	redirect_to "/the_wall"
		# else
		# 	flash[:error] = "Comment can't be blank!"
		# 	redirect_to "/the_wall"
		# end
		flash[:error] = "Comment can't be blank!" unless new_comment.save
		redirect_to "/the_wall"
	end

	def destroy
		Comment.find(params[:id]).destroy
		redirect_to "/the_wall"
	end

  def show
  	@comment = Comment.find(params[:id])
  end

  def edit
  	@comment = Comment.find(params[:id])
  end

  def update
  	comment = Comment.find(params[:id])
  	comment.update(comment_params)
  	redirect_to "/the_wall"
  end

  def index
  end

  def new
  end

  private

  def comment_params
  	params.require(:comment).permit(:comment, :post_id)
  end

end
