class VotesController < ApplicationController
  before_action :find_story

  def create_up
    @story.votes.create(user_id: current_user.id, updown: true)
    redirect_to root_path
  end

  def create_down
    @story.votes.create(user_id: current_user.id, updown: false)
    redirect_to root_path
  end

  private

  def find_story
    @story = Story.find(params[:story_id])
  end
end
