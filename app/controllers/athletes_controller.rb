class AthletesController < ApplicationController

	def new
		@athlete = User.new
	end

	def create
		@athlete = User.new  athlete_params

		@athlete.role = "athlete"
		@athlete.trainer = current_user


		if @athlete.save
			flash[:notice] = "Entry created successfully"
			redirect_to controller: :trainers, action: :show, id: current_user.id
		else
			flash[:notice] = "User not created"
			render new_athlete_path
		end
	end


	def index
		@athletes = User.where(trainer_id: current_user.id)
		#@users = User.all
	end

	def show
		#@user = User.find(params[:id])
	end

	private
	def athlete_params
		params.require(:athlete).permit(:name,:email, :password, :role)
	end
end
