class Training < ActiveRecord::Base
	
	# Trainer - training relationship
	belongs_to :trainer, class_name: "User", foreign_key: "trainer_id"

	# Athlete - trainings relationship
	has_and_belongs_to_many :athletes, class_name: "User", join_table: "athletes_trainings", association_foreign_key: 'athlete_id', foreign_key: 'training_id'
end

