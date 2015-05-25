class TrainingsController < ApplicationController

	def new
		@trainer = User.find params[:user_id]
		@training = Training.new
	end

	def create
		@trainer = User.find params[:user_id]		
		@training = @trainer.trainer_trainings.new training_params
		
		if @training.save
			#flash[:notice] = "Entry created successfully"
			redirect_to user_trainings_path(@trainer.id)
		else
			flash[:notice] = "training not created"
			render new_user_training_path(@trainer.id)
		end	
	end

	def index
	  	@trainer = User.find params[:user_id]
	  	@trainings = @trainer.trainer_trainings.order(created_at: :desc)
  	end

	def show
		@training = training.find(params[:id])
	end

	private
	def training_params
		params.require(:training).permit(:name, :day, :description, :trainer_id)
	end
end
