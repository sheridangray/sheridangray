class AddSortOrderToStyles < ActiveRecord::Migration
  def change
    add_column :styles, :sort_order, :integer
  end
end
