class Admin::UsersController < Admin::BaseController

  # before_action :authenticate_admin!

  def new
    @eser = User.new
  end

  def create
    @eser = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if uUser.update_attributes(User_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      # flash[:notice] = t('success', obj: 'meow meow', past_participle: 'deleted')
    end
    redirect_to admin_users_path
  end

  def hide_user
    @user = User.find(params[:id])
    @user.update_attributes({ hidden: !@user.hidden })
    redirect_to admin_users_path
  end

  protected

    def User_params
      params.require(:user).permit(
        :title,
        :sub_title,
        :description,
        :cost,
        :avatar,
        :avatar_cache,
        :remove_avatar,
        :hidden
      )
    end
end
