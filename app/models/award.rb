class Award < ActiveRecord::Base
	validate :name, uniqueness: true
	has_many :movies, :through => :movies_awardee, :source => :awardee, :source_type => 'Movie'
	has_many :directors, :through => :movies_awardee, :source => :awardee, :source_type => 'Director'
	has_many :actors, :through => :movies_awardee, :source => :awardee, :source_type => 'Actor'
end
