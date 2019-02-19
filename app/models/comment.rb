class Comment < ApplicationRecord
  belongs_to :story
  belongs_to :user
  validates :body, presence: true, length: {minimum: 5, maximum: 500}
end
