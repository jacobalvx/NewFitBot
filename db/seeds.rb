
require 'faker'

def create_trainers(total)
	trainers = []
	total.times do |row|
  		trainers << User.create(name: Faker::Name.first_name, email: Faker::Internet.email, role: "trainer")
  	end
  	trainers
end

def create_athletes(total)
	athletes = []
	total.times do |row|
  		athletes <<  User.create(name: Faker::Name.first_name, email: Faker::Internet.email, role: "athlete")
  	end
  	athletes
end

def create_workouts(trainer, total)
	total.times do |row|
		trainer.workouts.create(name: Faker::Name.first_name)
	end
end

####################################################################

trainers = create_trainers(2)

trainers.each do |trainer|
	create_workouts(trainer,3)
end

athletes = create_athletes(2)


#trainer = User.create(name: "Rafa", email: "rafa@hotmail.com", password: "hola5678", role: "trainer")
#trainer.trainings.create(name: "First", description: "The first training")



puts "Seed complete"