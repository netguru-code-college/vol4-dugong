class CategoriesController < ApplicationController

  def show
    @category = Category.friendly.find(params[:id])
    ranking
  end

  def bad
     redirect_to category_path(Category.first)
  end

  private

  def ranking
    @how_many_in_ranking = 10
    @num_bad_stories = @category.stories.count

    story_hash = {}
    @category.stories.each do |story|
      points = 0
      story.votes.each { |vote| vote.updown == true ? points += 1 : points -= 1}
      story_hash[story] = points
    end

    @rank = story_hash.sort_by {|_key, value| value}
  end

end
