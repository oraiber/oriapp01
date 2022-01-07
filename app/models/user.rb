class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet

  validates :nickname, presence: true, length: { maximum: 10 }

  def liked_by?(tweet_id)
    likes.where(tweet_id: tweet_id).exists?
  end
end