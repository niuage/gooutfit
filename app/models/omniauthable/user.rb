module Omniauthable
  module User
    extend ActiveSupport::Concern

    module ClassMethods
      def format_omniauth! o
        if extra = o["extra"]
          if o['info']['photo'].blank?
            o['info']['image'] = extra["raw_info"]["photo"] rescue nil
          end
          o["extra"].delete_if{ |k, v| k != "user_hash" }
          if (user_hash = extra["user_hash"])
            includes = [ "location" ]
            user_hash.delete_if{ |k, v| !includes.include? key }
          end
        end
      end
    end

    def update_omniauth_attributes omniauth, save = false
      user_info = omniauth['info']
      user_hash = omniauth['extra']['user_hash'] if omniauth['extra']
      self.email = user_info['email'] if self.email.blank?
      self.login = user_info['nickname'] || user_info['name'] || omniauth_login(user_info) if self.login.blank?
      if self.avatar.blank?
        remote_avatar = user_info["image"].gsub("_normal", "_bigger").gsub("=square", "=large") rescue nil
        self.remote_avatar_url = remote_avatar
      end
      self.url = user_info["urls"]["Website"] if user_info["urls"] && self.url.blank?
      if user_hash
        self.location = user_hash['location']['name'] if self.location.blank? && user_hash['location']
      end
      self.save if save
    end

    def omniauth_login info
      "#{info["first_name"]}#{ info["last_name"] if info["last_name"] }"
    end

    def apply_omniauth omniauth
      update_omniauth_attributes omniauth
      authentications.build do |auth|
        auth.provider = omniauth['provider']
        auth.uid = omniauth['uid']
        auth.oauth_token = omniauth['credentials']['token']
        auth.oauth_secret = omniauth['credentials']['secret']
      end
    end

    def create_authentication! omniauth
      authentications.create! do |auth|
        auth.provider = omniauth['provider']
        auth.uid = omniauth['uid']
        auth.oauth_token = omniauth['credentials']['token']
        auth.oauth_secret = omniauth['credentials']['secret']
      end
    end

    def unused_services
      Authentication::Omniauth::SERVICES.reject{|s| authentications.map(&:provider).include?(s.to_s) }
    end

  end
end
