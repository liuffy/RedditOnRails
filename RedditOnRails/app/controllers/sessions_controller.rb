class SessionsController < ApplicationController
# There's no sessions model
   before_action :required_signed_in!, only: [:destroy]
  # skip_before_action :require_logged_in!, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      log_in!(user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["Incorrect username/password combination."]
      render :new
    end
  end

  def destroy
    log_out!(user)
    redirect_to new_session_url
  end

end
