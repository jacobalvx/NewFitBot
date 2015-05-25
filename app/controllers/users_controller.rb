class UsersController < ApplicationController
	
	def new
		@user = current_user
		if @user.role == "trainer"
			@user = User.new
			render 'new_athlete'
		end
	end

	def create
		@user = User.create user_params

		if @user.save
			#flash[:notice] = "Entry created successfully"
			redirect_to users_path #user_path
		else
			flash[:notice] = "User not created"
			#render 'new'
			render new_user_path
		end
	end


	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	private
	def user_params
		params.require(:user).permit(:name,:email, :password, :role)
	end
end
