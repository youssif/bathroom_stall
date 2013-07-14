class Victim < ActiveRecord::Base
  attr_accessible :city, :facebook_url, :gender, :name
  has_many :comments
  require "uri"

  def self.authenticate_victim(facebook_url)
  	@graph = Koala::Facebook::API.new
  	@facebook_url = facebook_url
  	@victim_profile_url = URI.parse(@facebook_url)
  	@facebook_profile_name_with_slash = @victim_profile_url.path
  	@facebook_profile_name = @facebook_profile_name_with_slash.gsub(/\//, '')
  	return @graph.get_object(@facebook_profile_name)
  end
end


# find_or_initilize_by_facebook_url