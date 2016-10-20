module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable,
    class_name: 'Vote',
    foreign_key: :votable_id,
    dependent: :destroy
  end

  def user_votes
    self.votes.sum(:value)
  end

end
