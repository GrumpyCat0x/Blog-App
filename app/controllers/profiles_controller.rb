class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_user
  before_action :correct_profile_user

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      flash[:success] = "Profile updated"
      redirect_to user_profile_path(@user)
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio, :date_of_birth)
  end

  def correct_profile_user
    unless current_user?(@user)
      flash[:danger] = "You don't have permission to view or edit this profile."
      redirect_to root_path
    end
  end
end