class UserController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    @recent_posts = @user.last_three_posts

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end
end
