class UsersController < ApplicationController

  def ensemble
    @members = User.all.where(ensemble_member: true).where(hidden: false).rank(:row_order)
    @admins = Admin.all
  end

end
