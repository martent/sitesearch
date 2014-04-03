class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :init_body_class

  private

  def init_body_class
    add_body_class(Rails.env)
    add_body_class("user") if current_user
  end

  # Adds classnames to the body tag
  def add_body_class(name)
    @body_classes ||= ""
    @body_classes << "#{name} "
  end

  def reset_body_classes
    @body_classes = nil
    init_body_class
  end

  def sub_layout(name = "", options = {})
    @sub_layout = name unless options[:except] == params[:action]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    if current_user.nil?
      if !request.xhr?
        session[:requested] = { url: request.fullpath, at: Time.now }
      end
      redirect_to login_path
    end
  end

  def redirect_after_login
    if session[:requested] && session[:requested][:at] && session[:requested][:at] > 10.minutes.ago
      requested_url = session[:requested][:url]
      session[:requested] = nil
      redirect_to requested_url
    else
      redirect_to root_path
    end
  end

  # IE bug fix: redirect to same action and add utf8="✓" if its not present but other query params are
  def ie_utf_fix
    if !request.xhr? && params[:action].present? &&
          params.except(:action, :controller).present? && params[:utf8].blank?
      return redirect_to({ action: params[:action], utf8: "✓"}.merge(params.except(:action, :controller)))
    end
  end
end
