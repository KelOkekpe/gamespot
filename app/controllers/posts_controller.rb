class PostsController < ApplicationController

  before_action :redirect_if_not_signed_in, only: [:new]

  def index
    @posts = current_user.posts
  end

  def sports
    @posts = Post.by_branch('sports').limit(8).order('created_at DESC')
  end

  def games
    @posts = Post.by_branch('games').limit(8).order('created_at DESC')
  end

  def music
    @posts = Post.by_branch('music').limit(8).order('created_at DESC')
  end


  def show
    @post = Post.find(params[:id])
      respond_to do |format|
        format.js
      end
  end

  def new
    @branch = params[:branch]
    @categories = Category.where(branch: @branch)
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to dashboard_path(@post)
    else
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :title, :category_id)
                         .merge(user_id: current_user.id) unless !user_signed_in?
  end

end
