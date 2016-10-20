# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  post_id    :integer
#  sub_id     :integer
#

class PostSub < ActiveRecord::Base
  validates :post, :sub, presence: true

  belongs_to :sub, inverse_of: :post_subs
  belongs_to :post, inverse_of: :post_subs
end
