class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :watchlist_item, dependent: :destroy
  has_many :watchlist, through: :watchlist_item, :source => :movies
  has_many :reviews
  validates :name, presence: true
  validates :name, length: { in: 3..20} 
  validates :about, length: { in: 5..200} 
  mount_uploader :avatar, AvatarUploader

    def add_to_watchlist(movie)
      WatchlistItem.create(movie: movie, user: self)
    end

    def remove_from_watchlist(movie)
      watchlist_item.find_by(movie: movie).try(:destroy)
    end

    def rate(movie, rating, comment)
      Review.create(user: self, movie: movie, rate: rating, comment: comment)
    end

end
