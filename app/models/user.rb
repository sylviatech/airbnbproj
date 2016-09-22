class User < ActiveRecord::Base
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
  has_many :authentications, :dependent => :destroy
  has_many :listings
  has_many :reservations


  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      #TERMINAL auth_hash
      #auth_hash["info"]
            #auth_hash["info"]['name'].split[0]

      u.firstname = auth_hash["info"]["name"].split[0]
                  #auth_hash["info"]['name'].split[-1]

      u.lastname = auth_hash["info"]["name"].split[-1]
                        #auth_hash["info"]['email']

      u.email = auth_hash["info"]["email"]
      #GOOGLE how to secure random string ruby
      u.password = SecureRandom.base64(8)
      u.authentications<<(authentication) #--> go to welcome_controller
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

end
