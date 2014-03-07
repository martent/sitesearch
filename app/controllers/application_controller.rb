class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
end
