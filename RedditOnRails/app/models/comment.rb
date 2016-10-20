# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  post_id           :integer          not null
#  user_id           :integer          not null
#  content           :text             not null
#  parent_comment_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Comment < ActiveRecord::Base
  include Votable # takes care of has_many association

  validates :content, :post, :author, presence: true

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :user_id,
    inverse_of: :comments
  )

  belongs_to :post, inverse_of: :comments

  has_many(
    :child_comments,
    class_name: 'Comment',
    foreign_key: :parent_comment_id
  )

  belongs_to(
    :parent_comment,
    class_name: 'Comment',
    foreign_key: :parent_comment_id
  )

  def has_children?
    return false if self.child_comments.nil?
    true
  end
end
