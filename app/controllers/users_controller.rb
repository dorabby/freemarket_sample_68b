class UsersController < ApplicationController
  def destroy
    user = current_user
    redirect_to new_session_path(resource_name)
  end
end
