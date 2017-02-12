class Review < ActiveRecord::Base
	validates :rate, :inclusion => { :in => 1..5, :message => "The rating must be from 1 to 5 stars." }
  	validates :rate, presence: true
  	validates :comment, length: { in: 3..20}  
	belongs_to :user, counter_cache: true
	validates :user, presence: true
	belongs_to :movie, counter_cache: true
	validates :movie, presence: true

end