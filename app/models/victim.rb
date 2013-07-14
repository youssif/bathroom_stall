class Victim < ActiveRecord::Base
  attr_accessible :city, :facebook_url, :gender, :name
  has_many :comments
  require "uri"

  def authenticate_victim(victim_id)
  	@graph = Koala::Facebook::API.new
  	@victim = Victim.find(victim_id)
  	@victim_profile_url = URI.parse(@victim.facebook_url)
  	@facebook_profile_name_with_slash = result.path
  	@facebook_profile_name = @facebook_profile_name_with_slash.gsub(/\//, '')
  	@facebook_info_hash = @graph.get_object(@facebook_profile_name)
  end
end
