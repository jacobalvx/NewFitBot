class AddTrainerIdToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :trainer_id, :integer
  end
end
