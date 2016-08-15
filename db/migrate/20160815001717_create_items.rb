class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

      t.string  :title,               null: false, default: ""
      t.text    :description,         null: false, default: ""
      t.text    :donate_button,       null: false, default: ""

      t.timestamps null: false
    end
  end
end
