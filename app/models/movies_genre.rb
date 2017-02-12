class MoviesGenre < ActiveRecord::Base
	belongs_to :movie, counter_cache: true
	belongs_to :genre, counter_cache: true
	validates_uniqueness_of :movie_id, :scope => [:genre_id]
  	validates :movie, presence: true
  	validates :genre, presence: true
end
