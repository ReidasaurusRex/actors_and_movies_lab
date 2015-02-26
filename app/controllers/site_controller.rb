class SiteController < ApplicationController
  before_action :check_logged_in

  def index
    @user = User.find(session[:user_id])
  end
end
