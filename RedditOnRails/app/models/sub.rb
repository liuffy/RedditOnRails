class Sub < ActiveRecord::Base

  validates :sub_name, :description, :mderator, presence: true
  validates :sub_name, uniqueness: true

  belongs_to(
    :moderator,
    class_name: 'User',
    foreign_key: :moderator_id,
    inverse_of: :subs
  )

end
