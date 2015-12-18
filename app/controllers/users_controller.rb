class UsersController < ApplicationController

  # before_filter tells the controller to run a given method before any other method
  # So, I have this set of instructions that I want to run first (in this case, except for create and new methods because current user doesn't exist there)
  before_filter :current_user, except: [:create, :new]

	def create
		new_user = User.create(user_params)
		if new_user.valid?
			flash[:success] = "You have successfully registered!"
			redirect_to "/" # or root_path (you could also use root_url - which includes localhost:3000, etc.)
		else
			# flash[:errors] = new_user.errors # implicitly invokes .messages
			# flash[:errors] = new_user.errors.messages # explicitly invokes .messages
			flash[:errors] = new_user.errors.full_messages # prettily prints the messages!
			redirect_to "/"
		end
	end

  def new
    if session[:user_id].present?
      redirect_to "/the_wall"
    end
  end

  def index
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
    unless @user == @current_user
      redirect_to user_edit_url(session[:user_id])
      ## user_edit helper method is defined in routes (as: :user_edit)
      ## user_edit_url helper method gives you the full url -> http://localhost:3000/users/:id/edit
      ## Alternatively, you could use the following:
      # redirect_to user_edit_path(params[:id])
      ## user_edit_path helper method gives you only the root-relative path -> /users/:id/edit
    end
  end

  def update
    user = User.find(params[:id])
    # Stop user from trying to update unless it's their own profile:
    unless user == @current_user
      # redirect_to "/users/#{user.id}" and return # stop running the function, as ruby does not interrupt the function with the new http request
      redirect_to user_show_url(session[:user_id]) and return
    end
    if user.update(user_params)
      # redirect_to "/users/#{user.id}"
      redirect_to user_show_url(session[:user_id])
    else
      redirect_to user_edit_url(params[:id])
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :location, :password, :password_confirmation)
  end

  def current_user
    @current_user = User.find(session[:user_id])
  end

end
