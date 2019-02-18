class StoriesController < ApplicationController

def new
  @story = Story.new
end

def show
  @story = Story.find(params[:id])
end

def create
  @story = current_user.stories.build(story_params)
  if @story.save
    flash[:notice] = "Quote was successfully added. Look for it below. :) "
    redirect_to root_path
  else
    render 'new'
  end

end

private
  def story_params
    params.require(:story).permit(:title, :text, :category, :picture, :user_id)
  end
end
