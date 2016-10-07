class CreateClothingTypes < ActiveRecord::Migration
  def change
    create_table :clothing_types do |t|
      t.string :name
      t.text :description
      t.integer :sort_order
    end
  end
end
