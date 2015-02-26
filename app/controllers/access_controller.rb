class AccessController < ApplicationController
  before_action :check_session_id, only: [:signup, :login]
  before_action :check_logged_in, only: [:home]
  def signup
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path
    else
      render :signup, alert: "Failed to create user"
    end
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.find_by_username(params[:username])
      if found_user
        authorized_user = found_user.authenticate(params[:password])
        if authorized_user
          session[:user_id] = authorized_user.id
          redirect_to home_path
        else
          flash[:notice] = "Password does not match username"
          render :login
        end
      else
        flash[:notice] = "User not found"
        render :login
      end
    else
      flash[:notice] = "Please input both password and username"
      render :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end

  def check_session_id
    if session[:user_id]
      redirect_to home_path
    end
  end

end
