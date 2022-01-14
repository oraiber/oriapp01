class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :text, presence: true, length: {maximum: 500}

  def self.search(keyword)
    where(["text like?", "%#{keyword}%"])
  end
end
