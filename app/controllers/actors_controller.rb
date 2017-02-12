class ActorsController < ApplicationController
  before_action :prepare_actor, only: [:show]

  def index
  	params[:page] ||= 1
  	@actors = Actor.page(params[:page])
  end

  def show
  	@awards = @actor.awards
  	@movies = @actor.movies
  end

  private
  def prepare_actor
  	if params[:id]
  		@actor = Actor.find_by(params[:id])
  	else
  		redirect_to session[:return_to], alert: 'Wrong Actor ID.'
  	end
  end

end