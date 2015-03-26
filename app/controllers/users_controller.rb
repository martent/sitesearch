class UsersController < ApplicationController
  before_action :authorize
  before_action { add_body_class('admin') }

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    myself = @user == current_user

    @user.destroy
    if myself
      session[:user_id] = nil
      session[:requested] = nil
      redirect_to root_url, notice: 'Du har raderat dig själv!'
    else
      redirect_to users_url, notice: 'Användaren raderades'
    end
  end
end
