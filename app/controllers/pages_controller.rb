class PagesController < ApplicationController

  def index

  end

  def dashboard

  end

  def main_feed
    @posts = Post.limit(5)
  end

end
