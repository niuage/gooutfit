class User < ActiveRecord::Base
  include Omniauthable::User

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  mount_uploader :avatar, AvatarUploader

  has_many :authentications, dependent: :destroy

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def facebook_auth
    authentications.facebook.first
  end

  def facebook_token
    (auth = facebook_auth) && auth.oauth? && auth.oauth_token
  end
end
