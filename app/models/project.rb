class Project < ActiveRecord::Base
  # attr_accessible :avatar
  include RankedModel
  ranks :row_order

  mount_uploader :avatar, AvatarUploader
  
end
