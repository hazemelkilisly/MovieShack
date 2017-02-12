class Actor < ActiveRecord::Base
  	has_many :awards, through: :awards_awardee, as: :awardee
  	has_many :movies, through: :movies_actor
  	mount_uploader :avatar, AvatarUploader

end
