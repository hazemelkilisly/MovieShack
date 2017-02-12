class MoviesActor < ActiveRecord::Base
	belongs_to :actor, counter_cache: true
  	belongs_to :movie, counter_cache: true
	validates_uniqueness_of :movie_id, :scope => [:actor_id]
  	validates :movie, presence: true
  	validates :actor, presence: true
end
