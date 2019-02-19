require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of(:body) }
  it { should validate_length_of(:body).is_at_least(5) }
  it { should validate_length_of(:body).is_at_most(500) }
  it { should belong_to(:story) }
  it { should belong_to(:user) }
end
