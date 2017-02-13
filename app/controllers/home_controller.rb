class HomeController < ApplicationController
	def index
		@featured = Movie.featured.limit(5)
		@recent = Movie.recent.limit(5)
		@news = News.includes(:movie).order(created_at: :desc)
	end
end
