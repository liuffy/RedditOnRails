class CommentsController < ApplicationController
# Write a CommentsController and add a route to create Comment.
# The new route could have a url like /posts/123/comments/new.
# I recommend that your form post to a top-level /comments URL, though.
# These are the only two comments routes you need so far.

  def new
    @comment = Comment.new(post_id: params[:post_id])
    render :new
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
    @new_comment = Comment.new(
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
