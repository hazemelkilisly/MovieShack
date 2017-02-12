class Genre < ActiveRecord::Base
	validates :name, presence: true
  	validates :name, length: { in: 2..20}  
  	  	has_many :movies_genres, dependent: :destroy
  	has_many :movies, through: :movies_genres
end
