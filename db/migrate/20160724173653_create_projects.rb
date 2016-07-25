class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title,               null: false, default: ""
      t.string :sub_title

      t.text   :description,          null: false, default: ""
      t.integer :cost,                null: false, default: 0    

      t.timestamps null: false
    end

    add_index :projects, :title,     unique: true
  end
end
