class PostController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.all.where(author_id: params[:user_id])

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    @comments = Comment.all.where(post_id: params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = params[:user_id]
    if @post.save
      @post.update_counter
      flash[:success] = 'Object successfully created'
      redirect_to user_post_path(id: @post.id, user_id: @post.author_id)
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_post_url(current_user, @post), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def like
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:id], author_id: params[:user_id])
    @like = Like.create(post_id: @post.id, Author_id: current_user.id)
    @like.update_likes_counter
    redirect_to user_post_path(@user, @post)
  end

  def destroy
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
    @post.destroy
    redirect_to user_url(@user)
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
