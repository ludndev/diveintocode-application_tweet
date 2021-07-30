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
    if @content.nil? || @content.length < 1 || @content.length > 140
      flash[:danger] = "tweet content is invalid"
      redirect_to new_tweet_path
    else
      @tweet = Post.create(content: @content)

      if @tweet.valid?
        flash[:success] = "create success"
        redirect_to show_tweet_path(id: @tweet.id)
      else
        flash[:danger] = "create failed"
        redirect_to show_tweet_path(id: @tweet.id)
      end
    end
  end

  def post_update
    @id = params[:id]
    @content = params[:content]

    if @content.nil? || @content.length < 1 || @content.length > 140
      flash[:danger] = "tweet content is invalid"
      redirect_to new_tweet_path
    else
      @post = Post.find(@id)
      @tweet = @post.update(content: @content)

      if @tweet
        flash[:success] = "update success"
        redirect_to show_tweet_path(id: @post.id)
      else
        flash[:danger] = "update failed"
        redirect_to show_tweet_path(id: @post.id)
      end
    end
  end

end
