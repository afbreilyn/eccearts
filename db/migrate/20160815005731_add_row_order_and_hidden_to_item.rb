class AddRowOrderAndHiddenToItem < ActiveRecord::Migration
  def change
    add_column :items, :row_order, :integer
    add_column :items, :hidden, :boolean, default: false
  end
end
