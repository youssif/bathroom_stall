class Comment < ActiveRecord::Base
	attr_accessible :message
  belongs_to :users # attr_accessible :title, :body
end
