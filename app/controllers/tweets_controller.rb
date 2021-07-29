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
      redirect_to tweets_index_path, notice: 'delete success'
    else
      redirect_to tweets_index_path, notice: 'delete failed'
    end
  end

  # --- post methods

  def post_new
    @content = params[:content]

    @tweet = Post.create(content: @content)

    if @tweet
      redirect_to show_tweet_path(id: @tweet.id), notice: 'create success'
    else
      redirect_to show_tweet_path(id: @tweet.id), notice: 'create failed'
    end
  end

  def post_update
    @id = params[:id]
    @content = params[:content]

    @post = Post.find(@id)
    @tweet = @post.update(content: @content)

    if @tweet
      redirect_to show_tweet_path(id: @tweet.id), notice: 'update success'
    else
      redirect_to show_tweet_path(id: @tweet.id), notice: 'update failed'
    end
  end

end
