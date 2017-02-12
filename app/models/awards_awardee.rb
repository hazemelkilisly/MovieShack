class AwardsAwardee < ActiveRecord::Base
	belongs_to :award, counter_cache: true
  	belongs_to :awardee, polymorphic: true, counter_cache: true
	validates_uniqueness_of :movie_id, :scope => [:awardee_id, :awardee_type]
  	validates :movie, presence: true
  	validates :awardee, presence: true
end
