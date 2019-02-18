class StoriesController < ApplicationController
  before_action :set_category

def new
  @story = Story.new
end

def show
  @story = Story.find(params[:id])
end

def create
  @story = current_user.stories.build(story_params)
  @story.category = @category

  if @story.save
    flash[:notice] = "Story was successfully added. Look for it below. :) "
    redirect_to root_path
  else
    render 'new'
  end

end

private
  def story_params
    params.require(:story).permit(:title, :text, :category, :picture, :user_id)
  end

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end
end
