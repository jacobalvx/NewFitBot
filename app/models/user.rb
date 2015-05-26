class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	# Trainer - training relationship
	has_many :trainer_trainings, class_name: 'Training', foreign_key: "trainer_id"

	# Athlete - trainings relationship
	has_and_belongs_to_many :athlete_trainings, class_name: "Training", join_table: "athletes_trainings", association_foreign_key: 'training_id', foreign_key: "athlete_id"

	# Athlete - trainer relationship
	belongs_to :trainer, :class_name => "User", :foreign_key => "trainer_id"
	has_many :athletes, :class_name => "User", :foreign_key => "trainer_id"

	#################################################################################

	after_initialize :set_default_role, :if => :new_record?

	validates :role, inclusion: { in: %w(trainer athlete)}
	validates :role, presence: true

	def is_trainer?
		role == 'trainer'
	end

	def is_athlete?
		role == "athlete"
	end

	private 
	def set_default_role
		unless self.role 
			self.role ||= "trainer"
		end
	end

end
