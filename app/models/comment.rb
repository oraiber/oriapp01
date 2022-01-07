class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  validates :content, presence: true, lengh: {maximum: 150}
end
