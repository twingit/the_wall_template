class LikesController < ApplicationController

	def create
		new_like = Like.new(like_params)
		new_like.user = User.find(session[:user_id])
		# if new_like.save
		# 	redirect_to "/the_wall"
		# else
		# 	flash[:errors] = new_like.errors.full_messages
		# 	redirect_to "/the_wall"
		# end
		flash[:errors] = new_like.errors.full_messages unless new_like.save
		redirect_to "/the_wall"
	end

	def destroy
		Like.find(params[:id]).destroy
		redirect_to "/the_wall"
	end

	private

	def like_params
		params.permit(:parent_id, :parent_type)
	end

end
