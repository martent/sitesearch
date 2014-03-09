class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_after_login
  end

  def destroy
    session[:user_id] = nil
    session[:requested] = nil
    redirect_to root_url, notice: "Nu är du utloggad"
  end

  def failure
    flash[:error] = "Något gick fel. Inloggningen misslyckades"
    session[:user_id] = nil
    redirect_to root_url
  end
end
