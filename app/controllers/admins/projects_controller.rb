class Admin::ProjectsController < Admin::BaseController

  def new
    @project = Project.new
  end

  def index

  end

end