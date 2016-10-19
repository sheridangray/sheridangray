class CreateClothingItems < ActiveRecord::Migration
  def change
    create_table :clothing_items do |t|
      t.date :depreciate_on
      t.date :purchased_on

      t.timestamps null: false
    end
  end
end
