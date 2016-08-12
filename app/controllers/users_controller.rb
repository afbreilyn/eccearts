class UsersController < ApplicationController

  def ensemble
    @members = User.all.where(ensemble_member: true)
  end

end
