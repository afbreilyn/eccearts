class ProjectsController < ApplicationController

  def index
    @projects = Project.rank(:row_order).all
  end

end
