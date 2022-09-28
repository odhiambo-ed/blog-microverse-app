class CommentController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
  end

  def create
    @publisher = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment].permit(:Text))
    @comment.Author_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      @comment.update_comments_counter
      flash[:success] = 'Object successfully created'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to user_post_path(@publisher, @post)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to user_post_url(current_user, comment.post), notice: 'Comment was successfully destroyed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
