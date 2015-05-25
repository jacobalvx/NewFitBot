class AddAthleteTrainerRelationship < ActiveRecord::Migration
	def change
		add_column :users, :trainer_id, :integer, index: true
	end
end
