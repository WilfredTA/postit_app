class CommentsController < ApplicationController
  before_action :require_user
  def create
    @comment = Comment.new(params.require(:comment).permit(:body));
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = "Comment has been created"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end


end
