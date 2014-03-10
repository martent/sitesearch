class UsersController < ApplicationController
  before_action :authorize
  before_action { add_body_class('admin') }

  def index
    @users = User.all
  end
end
