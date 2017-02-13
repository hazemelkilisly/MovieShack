class Movie < ActiveRecord::Base
	RATES = [
	    'G',
	    'PG',
	    'PG-13',
	    'R',
	    'NC-17'
	  ]

  scope :featured, -> { where(featured: true) }

  scope :recent, -> { where(release_date: 1.month.ago.to_date..Date.today).order(created_at: :desc) }

  belongs_to :director, counter_cache: true
	has_many :reviews
	has_many :news
	has_many :awards, :through => :awards_awardee, :as => :awardee
  has_many :awards_awardee, dependent: :destroy
	has_many :watchlist_item, dependent: :destroy
  has_many :movies_genres, dependent: :destroy
  has_many :genres, through: :movies_genres
  mount_uploader :poster, AvatarUploader

  validates :director, presence: true

	validates :rating, inclusion: { in: RATES }
  validates :rating, presence: true

  validates :name, presence: true
  validates :name, length: { in: 2..30}

  # validates :about, length: { in: 5..200} 

  	def feature
  		self.update_attribute(:featured, true)
  	end

  	def unfeature
  		self.update_attribute(:featured, false)
  	end

    def award(award)
      AwardAwardee.create(awardee: self, award: award)
    end

    def remove_award(award)
      awards_awardee.find_by(award: award).try(:destroy)
    end

    def add_genre(genre)
      MovieGenre.create(movie: self, genre: genre)
    end

    def remove_genre(genre)
      movies_genres.find_by(genre: genre).try(:destroy)
    end
end
