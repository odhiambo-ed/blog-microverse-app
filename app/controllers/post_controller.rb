class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def show; end
end
