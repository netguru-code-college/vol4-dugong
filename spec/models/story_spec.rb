require 'rails_helper'

RSpec.describe Story, type: :model do
    it { should have_many(:comments) }
    it { should have_many(:votes) }
    it { should belong_to(:user) }
    it { should belong_to(:location) }
end
