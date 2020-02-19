class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update
  end

  def edit
    @user = current_user
  end

  def destroy
    user = current_user
    redirect_to new_session_path(resource_name)
  end

  private

  def user_params
    params.require(:user).parmit(:nick_name,:family_name,:name,:family_name_frigana,:name_frigana,:birthday,:email)
  end
end