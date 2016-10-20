module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable,
    class_name: 'Vote',
    dependent: :destroy
  end

  def user_votes
    self.votes.sum(:value)
  end

end
