class Project < ActiveRecord::Base
  # attr_accessible :avatar

  mount_uploader :avatar, AvatarUploader
end
