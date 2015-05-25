class AddAthletesTrainings < ActiveRecord::Migration
  def change
  	create_table :athletes_trainings, id: false do |t|
      t.integer :athlete_id, index: true
      t.integer :training_id, index: true
    end
  end
end
