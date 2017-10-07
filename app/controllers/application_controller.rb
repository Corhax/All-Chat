class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end


  protected

    def configure_permitted_parameters
      fields = [:first_name, :last_name, :email]

      devise_parameter_sanitizer.permit(:sign_up, keys: [fields])
      devise_parameter_sanitizer.permit(:account_update, keys: [fields, :about, :birthday, :avatar])
    end

end
