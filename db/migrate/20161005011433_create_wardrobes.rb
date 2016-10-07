class CreateWardrobes < ActiveRecord::Migration
  def change
    create_table :wardrobes do |t|
      t.references :style, index: true, foreign_key: true
      t.integer :annual_income
      t.integer :family_size
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
