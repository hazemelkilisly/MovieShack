class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_action :store_location

	private

	def store_location
	  session[:return_to] = request.fullpath if request.get? and controller_name != "user_sessions" and controller_name != "sessions"
	end

end
