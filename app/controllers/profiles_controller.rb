class ProfilesController < ApplicationController

  def overview
    @user = current_user
  end
end
