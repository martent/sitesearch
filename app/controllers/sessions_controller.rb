class SessionsController < ApplicationController
  def create
    auth = env["omniauth.auth"]

    if authorized?(auth)
      user = User.from_omniauth(auth)
      user.touch
      session[:user_id] = user.id
      redirect_after_login
    else
      flash[:error] = "Du är inte auktoriserad för applikationen."
      redirect_to root_path
    end
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

  private
    def authorized?(auth)
      return true if Rails.env.test? # mock
      octoclient = Octokit::Client.new access_token: auth['credentials']['token']
      octoclient.team_member?(APP_CONFIG["sitesearch_github_team"], auth["info"]["nickname"])
    end
end
