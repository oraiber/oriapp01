class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  validate do
    unless user && user.like_for?(tweet)
      errors.add(:base, :invalid)
    end
  end
end
