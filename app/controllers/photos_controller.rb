class PhotosController < ApplicationController

  def index
    # @photos = Photo.group(:category_id)
    @photos = Photo.all.group_by(&:category_id)
  end

end
