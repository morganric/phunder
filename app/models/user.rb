class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  has_many :campaigns
  has_many :photos

  def self.find_for_facebook_oauth(auth)
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.name = auth.info.name
        user.provider = auth.provider
        user.fb_uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        # user.profile.image = auth.info.image # assuming the user model has an image
      end
  end
  
end
