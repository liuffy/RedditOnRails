# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  value        :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#  votable_id   :integer          not null
#  votable_type :string           not null
#  user_id      :integer          not null
#

class Vote < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: [:votable_id, :votable_type]}
  validates :voter, presence: true

  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: 'User', foreign_key: :user_id, inverse_of: :votes


end
