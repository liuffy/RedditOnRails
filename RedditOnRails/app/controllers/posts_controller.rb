class PostsController < ApplicationController

    before_action :user_is_auth!, only: [:edit, :update]
    before_action :require_logged_in!, except: [:show]

    def new
      @post = Post.new
      render :new
    end

    def create
      @post = current_user.posts.new(post_params)

      if @post.save
        redirect_to post_url(@post)
      else
        flash.now[:errors] = @post.errors.full_messages
        render :new
      end
    end

    def show
      @post = Post.find(params[:id])
      render :show
    end

    def edit
      # Write an edit route where the moderator is allowed to update the title and description.
      @post = Post.find(params[:id])
      render :edit
    end

    def update
      @post = Post.find(params[:id])

      if @post.update
        redirect_to post_url(@post)
      else
        flash.now[:errors] = @post.errors.full_messages
        render edit
      end
    end

    private

    def user_is_author!
      return if Post.find(params[:id]).author == current_user
      render json: "You are not the author of this post", status: :forbidden
    end

    def post_params
      params.require(:post).permit(:title, :content, :author_id, :url)
    end
end
