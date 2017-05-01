class UsersController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if @user.send(user_update_strategy, user_params)
      redirect_to :root, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  #######
  private
  #######

  # TODO: Refactor
  def set_user
    @user = User.find_by_id(current_user)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_update_strategy
    if params[:user].values_at(:password, :password_confirmation).try(:all, &:blank?)
      :update_without_password
    else
      :update
    end
  end
end
