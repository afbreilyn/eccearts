class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :avatar, null: false
      t.integer :category_id
      t.string :title

      t.timestamps null: false
    end
  end
end
