class VotesController < ApplicationController
  before_action :find_story

  def create_up
    if already_voted?
      flash[:notice] = "You can't vote more than once"
    else
      flash[:success] = "Thanks for voting"
      @story.votes.create(user_id: current_user.id, updown: true)
    end

    redirect_to category_story_path(Category.find(params[:category_id]), @story.id)

  end

  def create_down
    if already_voted?
      flash[:notice] = "You can't vote more than once"
    else
      flash[:success] = "Thanks for voting"
      @story.votes.create(user_id: current_user.id, updown: false)
    end

    redirect_to category_story_path(Category.find(params[:category_id]), @story.id)

  end

  private

  def already_voted?
    Vote.where(user_id: current_user.id, story_id:
    params[:story_id]).exists?
  end

  def find_story
    @story = Story.find(params[:story_id])
  end
end
