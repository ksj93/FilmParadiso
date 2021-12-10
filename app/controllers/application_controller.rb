class ApplicationController < ActionController::Base
  require 'themoviedb-api'
  Tmdb::Api.key("f351e2da846ddea6294e5547f0820d21")
  Tmdb::Api.language("ja")

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  # def guest_user?
  #   if current_user.guest == true && current_user.admin == true
  #
  #   elsif current_user.guest == true
  #     redirect_to tops_path
  #   end
  # end

  # def message_able?
  #   if User.find(params[:recipient_id]).guest == true
  #     redirect_to tops_path
  #   else
  #   end
  # end

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end
end
