class Comment < ActiveRecord::Base
	attr_accessible :message, :name
  belongs_to :users # attr_accessible :title, :body
end
