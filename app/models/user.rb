class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet

  validates :nickname, presence: true, length: { maximum: 10 }

  def like_for?(tweet)
    tweet && tweet.user != self && !likes.exists?(tweet_id: tweet.id)
  end

  def dele_for?(tweet)
    tweet && tweet.user != self && likes.exists?(tweet_id: tweet.id)
  end
end