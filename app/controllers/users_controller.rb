class UsersController < ApplicationController
	before_action :prepare_user, only: [:show] 

	def show
		@watchlist = @user.watchlist
	end

	private
	def prepare_user
		if params[:id]
			@user = User.find_by(params[:id])
		else
			redirect_to session[:return_to], alert: 'Wrong User ID.'
		end
	end

end
