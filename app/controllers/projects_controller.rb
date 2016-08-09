class ProjectsController < ApplicationController

  def all
    @projects = Project.all
    render 'projects/index'
  end

end
