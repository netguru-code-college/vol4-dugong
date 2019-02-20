class Comment < ApplicationRecord
  belongs_to :story
  belongs_to :user
  validates :body, presence: true, length: {minimum: 5, maximum: 500}

  after_commit :create_notifications, on: [:create]

  private

  def create_notifications
    Notification.create(
      notify_type: 'story',
      actor: self.user,
      user: self.story.user,
      target: self.story)
  end
end
