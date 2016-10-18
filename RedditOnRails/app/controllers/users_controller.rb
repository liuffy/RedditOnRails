class UsersController < ApplicationController
  # before_action :require_logged_in!, only: [:show]
  # skip_before_action :require_logged_in!, only: [:new, :create]
  # the new and create actions will work without requiring the user to be logged in

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
