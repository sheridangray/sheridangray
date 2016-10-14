class AddExpectedMonthsToExpireToClothingItem < ActiveRecord::Migration
  def change
    add_column :clothing_items, :expected_months_to_expire, :integer
  end
end
