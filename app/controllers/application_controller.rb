class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  before_action :init_body_class

  rescue_from Exception do |exception|
    if exception.is_a?(ArgumentError) && exception.message == "invalid byte sequence in UTF-8"
      # Silent rescue from IE9 UTF-8 url hacking bug, strip query and redirect to requested resource
      logger.warn "<=IE9 UTF-8 bug rescued"
      redirect_to controller: params[:controller], action: params[:action]
    else
      server_error(exception.message)
    end
  end

  rescue_from ActionController::RoutingError,
              ActionController::UnknownController,
              ::AbstractController::ActionNotFound,
              ActiveRecord::RecordNotFound do |exception|
    not_found(exception.message)
  end

  def not_found(msg = "Sidan kunde inte hittas")
    logger.warn msg
    logger.warn "Not found: #{request.fullpath}"
    respond_to do |format|
      format.html { render template: 'errors/not_found_error', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def server_error(msg = "Ett fel inträffade")
    logger.error msg
    logger.error "Path: #{request.fullpath}"
    respond_to do |format|
      format.html { render template: 'errors/server_error', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
  end

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
      if session[:requested] && session[:requested]['at'] && session[:requested]['at'] > 10.minutes.ago
        requested_url = session[:requested]['url']
        session[:requested] = nil
        redirect_to requested_url
      else
        redirect_to root_path
      end
    end
end
