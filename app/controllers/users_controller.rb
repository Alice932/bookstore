# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = User.find(current_user.id) if current_user
  end

  def update
    @user_form = UserForm.new(User.find(current_user.id), users_params)
    @user_form.save
    if @user_form.save
      flash[:notice] = t('privacy.update')
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    flash[:notice] = t('privacy.destroy')
    redirect_to root_url, notice: 'User deleted.' if @user.destroy
  end

  private

  def users_params
    params.require(:user).permit(:email, :current_password, :password, :password_confirmation, :type)
  end
end
