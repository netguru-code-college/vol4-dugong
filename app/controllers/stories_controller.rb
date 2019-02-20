class StoriesController < ApplicationController
  before_action :set_category

def new
  @story = Story.new
  @location = Location.new
end

def show

  @story = Story.find(params[:id])
  @comments = @story.comments
end

def create
  @lati = 53.1235
  @longi = 18.0084
  @location = Location
                .where(latitude: @lati)
                .where(longitude: @longi)
                .first || Location.create(latitude: @lati, longitude: @longi)
  @story = current_user.stories.build(story_params)
  @story.category = @category
  @story.location = @location

  if @story.save
    flash[:success] = "Story was successfully added. Look for it below. :) "
    redirect_to category_path(@category.id)
  else
    render 'new'
  end

end

private
  def story_params
    params.require(:story).permit(:title, :text, :category, :picture, :user_id, :location_id)
  end

  def set_category
    @category = Category.friendly.find(params[:category_id])
  end
end
