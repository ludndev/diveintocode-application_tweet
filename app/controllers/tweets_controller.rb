class TweetsController < ApplicationController

  def index
    @title = "List Of Tweets"
    @posts = Post.all
  end

  def new
    @title = "Create A New Tweet"
  end

  def show
    @id = params[:id]

    @post = Post.find(@id)
    @title = "Tweet : #{@post.id}"
  end

  def update
    @id = params[:id]

    @post = Post.find(@id)
    @title = "Update Tweet : #{@post.id}"
  end

  def delete
    @id = params[:id]

    @post = Post.find(@id)
    @tweet = @post.destroy()

    if @tweet
      flash[:success] = "deletion success"
      redirect_to tweets_index_path
    else
      flash[:danger] = "deletion failed"
      redirect_to show_tweet_path(id: @tweet.id)
    end
  end

  # --- post methods

  def post_new
    @content = params[:content]

    @tweet = Post.create(content: @content)

    if @tweet
      flash[:success] = "create success"
      redirect_to show_tweet_path(id: @tweet.id)
    else
      flash[:success] = "create failed"
      redirect_to show_tweet_path(id: @tweet.id)
    end
  end

  def post_update
    @id = params[:id]
    @content = params[:content]

    @post = Post.find(@id)
    @tweet = @post.update(content: @content)

    if @tweet
      flash[:success] = "update success"
      redirect_to show_tweet_path(id: @post.id)
    else
      flash[:success] = "update failed"
      redirect_to show_tweet_path(id: @post.id)
    end
  end

end
