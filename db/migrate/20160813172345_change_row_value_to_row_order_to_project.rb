class ChangeRowValueToRowOrderToProject < ActiveRecord::Migration
  def change
    rename_column :projects, :row_value, :row_order
  end
end
