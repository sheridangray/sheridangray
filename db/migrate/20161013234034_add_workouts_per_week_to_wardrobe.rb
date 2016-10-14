class AddWorkoutsPerWeekToWardrobe < ActiveRecord::Migration
  def change
    add_column :wardrobes, :workouts, :integer
  end
end
