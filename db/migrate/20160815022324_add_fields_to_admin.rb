class AddFieldsToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :bio,              :text
    add_column :admins, :avatar,           :string
    add_column :admins, :role,             :string
    add_column :admins, :personal_website, :string
  end
end
