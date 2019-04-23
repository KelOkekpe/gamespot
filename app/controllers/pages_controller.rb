class PagesController < ApplicationController

  def index

  end

  def dashboard

  end

  def main_feed
    @posts = Post.limit(16)
  end

  def new_post
    
  end
end
