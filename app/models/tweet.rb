class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :text, presence: true, lengh: {maximum: 500}
end
