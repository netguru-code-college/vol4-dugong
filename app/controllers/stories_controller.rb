class StoriesController < ApplicationController

def index
  @user = User.find(params[:user_id])
end

def new
end

def show
  def show
    @story = Story.find(params[:id])
  end
end

def create
  @user = User.find(params[:user_id])
  @story = @user.stories.create(story_params)
  redirect_to root_path
end

private
  def story_params
    params.require(:story).permit(:title, :text, :category, :picture)
  end
end
