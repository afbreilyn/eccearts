class ProjectsController < ApplicationController

  def index
    @projects = Project.where(hidden: false).rank(:row_order).all
  end

end
