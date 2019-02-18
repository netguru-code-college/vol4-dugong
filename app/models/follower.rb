class Follower < ApplicationRecord
  belongs_to :user
  # belongs_to :location
  belongs_to :followable, polymorphic: true
end
