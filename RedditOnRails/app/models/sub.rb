class Sub < ActiveRecord::Base

  validates :sub_name, :description, :moderator, presence: true
  validates :sub_name, uniqueness: true

  belongs_to(
    :moderator,
    class_name: 'User',
    foreign_key: :moderator_id,
    inverse_of: :subs
  )

  has_many :posts, through: :post_subs
  has_many :post_subs, inverse_of: :sub, dependent: :destroy

end
