class LikesController < ApplicationController
  def create
    @tweet = Tweet.find_by(params[:tweet_id])
    @like = current_user.likes.new(tweet_id: @tweet.id)
    @like.save
    redirect_to tweet_path(@like.tweet)
  end

  def destroy
    @tweet = Tweet.find_by(params[:tweet_id])
    @like = current_user.likes.find_by(tweet_id: @tweet.id)
    @like.destroy
    redirect_to tweet_path(@like.tweet)
  end
end
