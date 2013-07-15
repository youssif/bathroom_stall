class Victim < ActiveRecord::Base
	attr_accessible :city, :facebook_url, :gender, :name, :facebook_id
	has_many :comments
	require "uri"

	@@graph = Koala::Facebook::API.new

	def self.authenticate_victim(facebook_url)
		# @graph = Koala::Facebook::API.new
		@facebook_url = facebook_url
		@victim_profile_url = URI.parse(@facebook_url)
		@facebook_profile_name_with_slash = @victim_profile_url.path
		@facebook_profile_name = @facebook_profile_name_with_slash.gsub(/\//, '')
		return @@graph.get_object(@facebook_profile_name)
	end

	def find_profile_photo
		# @graph = Koala::Facebook::API.new
		@user_id = self.facebook_id
		@profile_pic = @@graph.get_picture(@user_id, {:type => "large"})
		return @profile_pic
	end

end
