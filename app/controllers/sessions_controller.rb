class SessionsController < ApplicationController
  def create
    user = User.new(user_params)
    user.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  private
  def user_params
    params.require(:env).permit(:provider, :uid, info: [:name], credentials: [:token, :expires_at])
  end
end