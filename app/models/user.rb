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
      end
    end
  end

  def self.user_photo
    @oauth = Koala::Facebook::OAuth.new('451981254876272', '059d463ac0dfb0102511550b9e4962b9')
    @oauth.url_for_oauth_code

    @graph = Koala::Facebook::GraphAPI.new(auth)
    @facebook_user = @graph.get_object("me")
    @facebook_user_photo = @graph.get_picture("me")
  end

end
