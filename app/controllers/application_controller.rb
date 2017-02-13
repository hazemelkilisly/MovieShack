class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_action :store_location
  before_action :configure_permitted_parameters, if: :devise_controller?

	private

	def store_location
	  session[:return_to] = request.fullpath if request.get? and controller_name != "user_sessions" and controller_name != "sessions"
	end

	protected
	def configure_permitted_parameters
    	devise_parameter_sanitizer.for(:sign_up)        << :name
    	devise_parameter_sanitizer.for(:sign_up)        << :about

  	end

end
