class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path(@tweet)
    else
      render new_tweet_path
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to root_path
    else
      redirect_to edit_tweet_path
    end
  end

  def show
    
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text).merge(user_id: current_user.id)
  end
end
