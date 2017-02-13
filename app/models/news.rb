class News < ActiveRecord::Base
  	validates :title, presence: true
  	validates :title, length: { in: 5..50}  
  	validates :desc, presence: true
  	# validates :desc, length: { in: 5..200}  
	belongs_to :movie, counter_cache: true
	validates :movie, presence: true
end
