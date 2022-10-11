class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order(created_at: :desc)
    @users = User.all
  end

  def new
    @tweet = Tweet.new
    @tweet.user = current_user
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
  end

  def create
    # @user = User.find(params[:id])
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    
    if @tweet.save
      redirect_to tweets_path
    else
      redirect_to tweets_path, status: :unprocessable_entity
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
  end

  def update
    # @tweet = Tweet.new(tweet_params)
    @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      flash[:message] = "Try again"
      redirect_to tweet_path(@tweet.id), status: :unprocessable_entity
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, status: :see_other
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
