class MoviesController < ApplicationController
  before_action :set_pagination, only: [:index, :featured, :recent]
  before_action :prepare_movie, except: [:index, :featured, :recent]

  def index
    @movies = Movie.page(@curr_page)
  end

  def featured
    @movies = Movie.featured.page(@curr_page)
  end

  def recent
    @movies = Movie.recent.page(@curr_page)
  end

  def show
    @awards = @movie.awards
    @genres = @movie.genres
    @news = @movie.news
  end

  def add_to_watchlist
    if (current_user.add_to_watchlist(@movie))
      redirect_to session[:return_to], notice: "Successfuly added #{@movie.name} to your Watchlist."
    else
      redirect_to session[:return_to], alert: "Please try again."
    end
  end

  def remove_from_watchlist
    if (current_user.remove_from_watchlist(@movie))
      redirect_to session[:return_to], notice: "Successfuly removed #{@movie.name} from your Watchlist."
    else
      redirect_to session[:return_to], alert: "Please try again."
    end
  end

  def review
    if params[:rate]
      if rating = current_user.rate(@movie, params[:rate], params[:comment])
        redirect_to session[:return_to], notice: "Successfuly rated #{@movie.name}."
      else
        redirect_to session[:return_to], alert: rating.errors
      end
    else
      redirect_to session[:return_to], alert: "You must choose a rating."
    end 
  end


  private
  def set_pagination
    @curr_page = params[:page] || 1
  end

  def prepare_movie
    if params[:id]
      @movie = Movie.find_by(params[:id])
    else
      redirect_to session[:return_to], alert: 'Wrong Movie ID.'
    end
  end

end
