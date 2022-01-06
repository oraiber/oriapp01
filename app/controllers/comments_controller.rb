class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to tweet_path(@comment.tweet)
    else
      @tweet = @comment.tweet
      @comments = @tweet.comments
      render "tweets/show"
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    comment = @tweet.comments.find(params[:id])
    comment.destroy
    redirect_to tweet_path(params[:tweet_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
