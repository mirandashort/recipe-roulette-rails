class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password, :first_name, :last_name)
    end

    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email, :password, :first_name, :last_name)
    end
  end
end
