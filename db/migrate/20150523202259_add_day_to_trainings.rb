class AddDayToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :day, :integer
  end
end
