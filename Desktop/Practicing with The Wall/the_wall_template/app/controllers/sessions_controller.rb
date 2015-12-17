class SessionsController < ApplicationController

	def create # Login
		user = User.find_by(email: session_params[:email])
		if user
			if user.authenticate(session_params[:password])
				session[:user_id] = user.id
				redirect_to "/the_wall"
			else
				flash[:error] = "Invalid Email/Password Combination" # Bad Password
				redirect_to "/"
			end
		else
			flash[:error] = "Invalid Email/Password Combination" # Bad Email
			redirect_to "/"
		end
	end

	def destroy # Logout
		session[:user_id] = nil
		redirect_to "/"
	end

	private

	def session_params
		params.require(:session).permit(:email, :password)
	end

end
