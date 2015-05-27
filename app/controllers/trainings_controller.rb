class TrainingsController < ApplicationController

	def new
		@trainer = current_user
		@training = Training.new
		@athletes = @trainer.athletes
	end

	def create
		@trainer = current_user	
		@training = @trainer.trainer_trainings.new training_params
		 
		
		if @training.save
			#flash[:notice] = "Entry created successfully"
			redirect_to trainer_trainings_path(@trainer.id)
		else
			flash[:notice] = "training not created"
			render "new"
		end	
	end

	def index
	  	@trainer = current_user
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
