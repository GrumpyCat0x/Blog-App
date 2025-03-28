class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def require_login
    unless logged_in?
      store_location
      flash[:danger] = "Please log in to access this page."
      redirect_to login_path
    end
  end

  def require_admin
    unless current_user&.admin?
      flash[:danger] = "You don't have permission to perform this action."
      redirect_to root_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end