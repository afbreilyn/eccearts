class AddRowOrderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :row_order, :integer, default: 0
  end
end
