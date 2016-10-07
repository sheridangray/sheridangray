class AddMonthlyBudgetToWardrobe < ActiveRecord::Migration
  def change
    add_column :wardrobes, :monthly_budget, :integer
  end
end
