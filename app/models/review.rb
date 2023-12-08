class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def voted_for?(user)
    ReviewVote.exists?(user: user, review: self)
  end

end
