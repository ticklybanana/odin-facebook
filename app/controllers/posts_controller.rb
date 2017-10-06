class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    Post.find(params[:id]).update_attributes(post_params)
  end

  def index
    @posts = current_user.posts
    current_user.friends.length.times do |i|
      @posts = @posts.union(current_user.friends[i - 1].posts)
    end
    @posts = @posts.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
  end
end
