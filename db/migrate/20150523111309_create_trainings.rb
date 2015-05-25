class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
		t.string   "name"
		t.string   "email"
		t.string   "password"
		t.string   "role"

      t.timestamps null: false
    end
  end
end
