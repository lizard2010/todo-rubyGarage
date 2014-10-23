class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!()
    end
  end
#  private
#  def user_params
#    params.require(:user).permit(:provider, :uid, :name, :oauth_token, :oauth_expires_at)
#  end

end
