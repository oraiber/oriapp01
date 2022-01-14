class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy, :show, :like, :unlike]
  before_action :move_to_index, except: [:index, :search]

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
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      redirect_to edit_tweet_path
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def like
    current_user.liked_tweets << @tweet
    redirect_to tweet_path
  end

  def unlike
    current_user.liked_tweets.destroy(@tweet)
    redirect_to tweet_path
  end  

  def search
    @tweets = Tweet.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
