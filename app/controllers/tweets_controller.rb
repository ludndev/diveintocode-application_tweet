class TweetsController < ApplicationController

  def index
    @title = "List of Tweets"
    @posts = Post.all
  end

  def new
    @title = "title"
  end

  def edit
    @title = "title"
  end

  def show
    @title = "Tweet "
  end

  # ---

  def create
    @title = "title"
  end

  def update
    @title = "title"
  end

  def destroy
    @title = "title"
  end

end
