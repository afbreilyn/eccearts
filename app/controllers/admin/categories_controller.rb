class Admin::CategoriesController < Admin::BaseController

  # before_action :authenticate_admin!

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      # flash[:notice] = t('success', obj: 'meow meow', past_participle: 'deleted')
    end
    redirect_to admin_categories_path
  end

  protected

    def category_params
      params.require(:category).permit(
        :name,
        :description
      )
    end

end