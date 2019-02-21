class AddLocationToStories < ActiveRecord::Migration[5.2]
  def change
    add_reference :stories, :location, foreign_key: true
  end
end
