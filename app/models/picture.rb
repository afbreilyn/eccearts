class Picture < ActiveRecord::Base
  belongs_to :category
  
  mount_uploader :avatar, AvatarUploader 
end
