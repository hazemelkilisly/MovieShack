class Director < ActiveRecord::Base
	has_many :awards, :through => :awards_awardee, :as => :awardee
  	has_many :movies
  	mount_uploader :avatar, AvatarUploader
end
