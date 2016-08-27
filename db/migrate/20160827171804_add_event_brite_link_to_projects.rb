class AddEventBriteLinkToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :eventbrite_link, :string
  end
end
