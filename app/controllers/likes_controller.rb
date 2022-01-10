class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    Like.create!(user_id: current_user, tweet_id: params[:tweet_id])
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    Like.find(params[:id]).destroy!
  end
end
