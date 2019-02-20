class StoriesController < ApplicationController
  before_action :set_category

def new
  @story = Story.new
  @location = Location.new
  @last_location = last_location
end
@last_location = !!current_user.stories.last.location || Location.build(latitude: 53.1235, longitude: 18.0084)
def show
  @story = Story.find(params[:id])
  @comments = @story.comments
end

def create
  @location = Location
                .where(latitude: params[:story][:latitude])
                .where(longitude: params[:story][:longitude])
                .first || Location.create(latitude: params[:story][:latitude], longitude: params[:story][:longitude])
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

  # Set up marker in last location
  def last_location
    if current_user.stories.last.valid?
      current_user.stories.last.location
    else
      Location.build(latitude: 53.1235, longitude: 18.0084)
    end
  end
end
