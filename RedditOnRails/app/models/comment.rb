class Comment < ActiveRecord::Base


# Write a CommentsController and add a route to create Comment. The new route could have a url like /posts/123/comments/new. I recommend that your form post to a top-level /comments URL, though. These are the only two comments routes you need so far.
#
# Edit your PostsController#show view to provide a link to a comment form and to display top-level comments.

  validates :content, :post, :author, presence: true

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :user_id,
    inverse_of: :comments
  )

  belongs_to :post, inverse_of: :comments

end
