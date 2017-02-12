class NewsController < ApplicationController
  before_action :prepare_news, only: [:show]
  def show
  end

  private
  def prepare_news
  	if params[:id]
  		@news = News.find_by(params[:id])
  	else
  		redirect_to session[:return_to], alert: 'Wrong News ID.'
  	end
  end

end
