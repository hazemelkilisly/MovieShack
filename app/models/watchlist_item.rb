class WatchlistItem < ActiveRecord::Base
	belongs_to :user, counter_cache: true
	belongs_to :movie, counter_cache: true
	validates :user, presence: true
	validates :movie, presence: true
	validates_uniqueness_of :user_id, :scope => [:movie_id]
end
