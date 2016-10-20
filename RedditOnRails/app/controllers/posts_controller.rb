class PostsController < ApplicationController

    before_action :user_is_auth!, only: [:edit, :update]
    before_action :require_logged_in!, only: [:create, :new]

    def new
      @post = Post.new
      render :new
    end

    def upvote
      vote(1)
    end

    def downvote
      vote(-1)
    end

    def vote(direction)
      @post = Post.find(params[:id])
      @user_vote = Vote.find_by(
        votable_id: @post.id, votable_type: "Post", user_id: current_user.id
      )

      if @user_vote
        @user_vote.update(value: direction)
      else
        @post.votes.create(
          user_id: current_user.id, value: direction
        )
      end

      redirect_to post_url(@post)
    end

    def create
      @post = current_user.posts.new(post_params)

      if @post.save!
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

      if @post.update(post_params)
        redirect_to post_url(@post)
      else
        flash.now[:errors] = @post.errors.full_messages
        render :edit
      end
    end

    private

    def user_is_auth!
      return if Post.find(params[:id]).author == current_user
      render json: "You are not the author of this post", status: :forbidden
    end

    def post_params
      params.require(:post).permit(:title, :content, :user_id, :url, sub_ids: [])
    end
end
