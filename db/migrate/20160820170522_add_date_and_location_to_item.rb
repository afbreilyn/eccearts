class AddDateAndLocationToItem < ActiveRecord::Migration
  def change
    add_column :items, :date, :datetime
    add_column :items, :location, :string
  end
end
