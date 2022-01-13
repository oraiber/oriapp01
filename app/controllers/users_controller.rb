class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @tweets = current_user.tweets
    @user = User.find(params[:id])
    tweets = @user.tweets

    like = Like.where(user_id: current_user.id).pluck(:tweet_id)
    @like_list = Tweet.find(like)
  end
end
