class Admin::PhotosController < Admin::BaseController

  # before_action :authenticate_admin!

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to admin_photos_path
    else
      render :new
    end
  end

  def index
    @photos = Photo.group(:category_id, :id)
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to admin_photos_path
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      # flash[:notice] = t('success', obj: 'meow meow', past_participle: 'deleted')
    end
    redirect_to admin_photos_path
  end


  protected

    def photo_params
      params.require(:photo).permit(
        :avatar,
        :category_id,
        :title
      )
    end
end
