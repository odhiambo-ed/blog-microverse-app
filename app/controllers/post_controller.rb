class PostController < ApplicationController
  def index
    @posts = Post.includes(:author).where(author: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.author = Current.user
    if @post.save
      flash[:notice] = 'Post was created successfully.'
      redirect_to user_post_path(@post.author, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
