class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :birthday, :email, :password, :remeber_me) }
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remeber_me) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :birthday, :about, :email, :password, :remeber_me) }
    end

end
