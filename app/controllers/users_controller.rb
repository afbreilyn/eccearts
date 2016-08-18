class UsersController < ApplicationController

  def ensemble
    @members = User.all.where(ensemble_member: true).where(hidden: false)
    @admins = Admin.all
  end

end
