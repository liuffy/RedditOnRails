# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer          not null
#

class Post < ActiveRecord::Base
  include Votable # takes care of has_many association

  validates :title, :user_id, presence: true #content not required (title alone is enough)

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :user_id,
    inverse_of: :posts
  )

  has_many :comments, inverse_of: :post
  has_many :subs, through: :post_subs, source: :sub
  has_many :post_subs, inverse_of: :post, dependent: :destroy

  def parent_comments
    self.comments.where(parent_comment_id: nil)
  end


end
