class Authentication < ActiveRecord::Base
  scope :facebook, where(provider: "facebook")

  belongs_to :user

  def update_tokens! credentials
    if (oauth_token != credentials['token']) || (oauth_secret != credentials['secret'])
      update_attributes(oauth_token: credentials['token'], oauth_secret: credentials['secret'])
    end
  end

  def oauth?
    !!oauth_token
  end
end
