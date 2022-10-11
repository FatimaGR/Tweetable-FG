class CommentsController < ApplicationController

  def new
    @commet = Comment.new
    @comment.user = current_user
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to tweet_path(comment_params[:tweet_id])
    else
      redirect_to tweet_path(comment_params[:tweet_id]), status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to tweet_path(@comment.tweet_id)
    else
      flash[:message] = "Try again"
      redirect_to tweet_path(@comment.tweet_id), status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to tweet_path(comment_params[:tweet_id]), status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :tweet_id)
  end
end
