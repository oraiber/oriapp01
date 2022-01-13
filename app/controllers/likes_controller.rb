class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    Like.create!(user_id: current_user, tweet_id: params[:tweet_id])
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    Like.find(params[:id]).destroy!
  end

  def show
    @nickname = current_user.nickname
    @user = User.find(params[:id])
    tweets = @user.tweets

    like = Like.where(user_id: current_user.id).pluck(:tweet_id)
    @like_list = Tweet.find(like)
  end
end
