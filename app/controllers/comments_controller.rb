class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:body));
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.creator = User.first

    if @comment.save
      flash[:notice] = "Comment has been created"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end


end
