class DirectorsController < ApplicationController
  before_action :prepare_director, only: [:show] 

  def index
  	params[:page] ||= 1
  	@directors = Director.page(params[:page])
  end

  def show
  	@awards = @director.awards
  	@movies = @director.movies
  end

  private
  def prepare_director
  	if params[:id]
  		@director = Director.find_by(params[:id])
  	else
  		redirect_to session[:return_to], alert: 'Wrong Director ID.'
  	end
  end
end
