class Admin::ProjectsController < Admin::BaseController

  # before_action :authenticate_admin!

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to admin_projects_path
    else
      render :new
    end
  end

  def index
    # @projects = Project.all
    @projects = Project.rank(:row_order).all
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to admin_projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      # flash[:notice] = t('success', obj: 'meow meow', past_participle: 'deleted')
    end
    redirect_to admin_projects_path
  end

  def hide_project
    @project = Project.find(params[:id])
    @project.update_attributes({ hidden: !@project.hidden })
    redirect_to admin_projects_path
  end

  def update_row_order
    @project = Project.find(project_params[:project_id])
    @project.row_order = project_params[:row_order]
    @project.save!

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  protected

    def project_params
      params.require(:project).permit(
        :title,
        :sub_title,
        :description,
        :cost,
        :avatar,
        :avatar_cache,
        :remove_avatar,
        :hidden,
        :row_order,
        :project_id
      )
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find(params[:id])
      end
end
