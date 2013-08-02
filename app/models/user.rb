class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email
  validates_presence_of :name
  has_many :victims

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
         user.picture = auth.info.image
      end
    end
  end


end
