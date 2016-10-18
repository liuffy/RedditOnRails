class SubsController < ApplicationController

  before_action :user_is_mod!, only: [:edit, :update] # Use a before_action to prohibit non-moderators from editing or updating the Sub.
  before_action :require_logged_in!
# Write all the standard seven routes for SubsController. You can leave out destroy if you like.


  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    # Write an edit route where the moderator is allowed to update the title and description.
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render edit
    end
  end

  private

  def user_is_mod!
    return if Sub.find(params[:id]).moderator == current_user
    render json: "You do not have moderator privileges for this sub", status: :forbidden
  end

  def sub_params
    params.require(:sub).permit(:sub_name, :description)
  end
end
