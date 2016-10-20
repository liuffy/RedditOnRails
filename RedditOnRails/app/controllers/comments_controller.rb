class CommentsController < ApplicationController
# Write a CommentsController and add a route to create Comment.
# The new route could have a url like /posts/123/comments/new.
# I recommend that your form post to a top-level /comments URL, though.
# These are the only two comments routes you need so far.

  def new
    @comment = Comment.new(post_id: params[:post_id])
    render :new
  end

  def upvote
    vote(1)
  end

  def downvote
    vote(-1)
  end

  def vote(direction)
    @comment = Comment.find(params[:id])
    @user_vote = Vote.find_by(
      votable_id: @comment.id, votable_type: "Comment", user_id: current_user.id
    )

    if @user_vote
      @user_vote.update(value: direction)
    else
      @comment.votes.create(
        user_id: current_user.id, value: direction
      )
    end

    redirect_to comment_url(@comment)
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      redirect_to new_post_comment_url(@comment.post_id)
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @new_comment = Comment.new( # for replying to parent comments
      post_id: @comment.post_id,
      parent_comment_id: @comment.id
    )

    render :show
end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end
end
