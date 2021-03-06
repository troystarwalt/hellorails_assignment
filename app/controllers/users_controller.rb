class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		result = User.create(user_params)
		if result
			flash[:notice] = "Welcome"
			redirect_to user_path(result)
		else
			flash[:notice] = "Sorry, try again."
			redirect_to new_user_path
		end
	end

	def index
		@users = User.all
		if params[:search]
			@users = User.serach(params[:search]).order("created_at DESC")
		else
			@users = User.all.order('created_at DESC')
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to @user
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:notice] = "Sorry to see you go."
		redirect_to users_path
	end
#need to fix this.
	# def search
	# end

	# def searchresults
	# 	@query = params[:username]
 #    	# TODO need to use ILIKE in Postgres, where strings are case sensitive
 #    	@users = User.where("username LIKE ?", "%#{params[:username]}%")
	# end
	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
