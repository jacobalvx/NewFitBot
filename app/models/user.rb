class User < ActiveRecord::Base
	
	# Trainer - training relationship
	has_many :trainer_trainings, class_name: 'Training', foreign_key: "trainer_id"

	# Athlete - trainings relationship
	has_and_belongs_to_many :athlete_trainings, class_name: "Training", join_table: "athletes_trainings", association_foreign_key: 'training_id', foreign_key: "athlete_id"

	# Athlete - trainer relationship
	belongs_to :trainer, :class_name => "User", :foreign_key => "trainer_id"
	has_many :athletes, :class_name => "User", :foreign_key => "trainer_id"

	#################################################################################

	validates :role, inclusion: { in: %w(trainer athlete)}
	#validates :role, :password, :email, presence: true

end
