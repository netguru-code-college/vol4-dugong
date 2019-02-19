class CommentsController < ApplicationController

  def create
    @story = Story.find(params[:id])
    @comment = @story.comments.new(comment_params)
    @comment.user = current_user
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :story_id)
  end

end
