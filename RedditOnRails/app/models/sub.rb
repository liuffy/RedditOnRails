# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  sub_name     :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Sub < ActiveRecord::Base

  validates :sub_name, :description, :moderator, presence: true
  validates :sub_name, uniqueness: true

  belongs_to(
    :moderator,
    class_name: 'User',
    foreign_key: :moderator_id,
    inverse_of: :subs
  )

  has_many :posts, through: :post_subs, source: :post
  has_many :post_subs, inverse_of: :sub, dependent: :destroy

end
