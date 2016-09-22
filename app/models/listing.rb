class Listing < ActiveRecord::Base
	mount_uploaders :avatar, ListingPictureUploader
	validates_presence_of :title
	validates_presence_of :content
	validates :content, length: { minimum: 20 }
	
	belongs_to :user
	has_many :reservations

end
