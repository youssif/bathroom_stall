class Victim < ActiveRecord::Base
  attr_accessible :city, :facebook_url, :gender, :name
  has_many :comments
end
