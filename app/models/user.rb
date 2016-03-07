class User < ActiveRecord::Base
  include Clearance::User
  # Associations
  has_many :authentications, :dependent => :destroy
  #Validations
  validates_presence_of :email, :message => 'must be included'
  validates_presence_of :encrypted_password, :message => '%{value} must be included'
  
 
   def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.name = auth_hash["info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications<<(authentication)
      u.password = "123456"
      u.save
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
