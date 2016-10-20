# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  value      :integer          not null
#  object_id  :integer          not null
#  voter_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Vote < ActiveRecord::Base
  validates :value, :voter, presence: true
  validates :voter_id, uniqueness: {scope: [:votable_id, :votable_type]}
  belongs_to :votable, polymorphic: true

  belongs_to(
    :voter,
    inverse_of: :votes
  )


end
