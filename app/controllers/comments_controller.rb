class CommentsController < ApplicationController
  before_action :set_category

  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = "Comment added succesfully"
    else
      flash[:danger] = "#{@comment.errors.full_messages.first}"
    end
    redirect_to category_story_path(@category, @story)

  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id, :story_id)
    end

    def set_category
      @category = Category.friendly.find(params[:category_id])
    end

end
