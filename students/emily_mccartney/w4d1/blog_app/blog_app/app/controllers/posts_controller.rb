class PostsController < ApplicationController

  def index 
  @posts = Post.all
  end 

  def show
  @post = Post.find(params[:id])
  end

  def new
  @post = Post.new
  end 

  def create
  post = Post.create(posts_params)
  redirect_to post
  end

  def edit
  @post = Post.find(params[:id])
  end 

  def update
  post = Post.find(params[:id])
  post.update_attributes(posts_params)
  redirect_to post
  end

  def destroy
  @post = Post.find(params[:id])
  @post.delete
  redirect_to posts_path
  end

  def posts_params
      params.require(:post).permit(:title,:description,:content,:author)
  end

end
