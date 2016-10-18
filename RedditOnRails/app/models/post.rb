class Post < ActiveRecord::Base

  validates :title, :author, presence: true #content not required (title alone is enough)

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    inverse_of: :posts
  )

  has_many :subs, through: :post_subs, source: :sub
  has_many :post_subs, inverse_of: :post, dependent: :destroy

end
