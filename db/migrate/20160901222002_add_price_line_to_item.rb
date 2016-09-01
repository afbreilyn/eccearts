class AddPriceLineToItem < ActiveRecord::Migration
  def change
    add_column :items, :price_line, :string, default: ""
  end
end
