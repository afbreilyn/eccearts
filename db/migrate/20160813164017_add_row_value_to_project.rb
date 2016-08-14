class AddRowValueToProject < ActiveRecord::Migration
  def change
    add_column :projects, :row_value, :integer
  end
end
