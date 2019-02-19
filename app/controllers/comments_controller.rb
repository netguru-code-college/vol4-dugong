class CommentsController < ApplicationController

  def create
    @story = Story.find(params[:id])
    @comment = @story.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment added succesfully"
    else
      flash[:danger] = "#{@comment.errors.full_messages.first}"
    end
    redirect_to story_path(@story)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id, :story_id)
    end

end
