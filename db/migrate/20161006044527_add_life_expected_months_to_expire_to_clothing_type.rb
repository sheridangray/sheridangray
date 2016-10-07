class AddLifeExpectedMonthsToExpireToClothingType < ActiveRecord::Migration
  def change
    add_column :clothing_types, :expected_months_to_expire, :integer
  end
end
