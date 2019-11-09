class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
