require 'rails_helper'

RSpec.describe Story, type: :model do
    it { should have_many(:comments) }
    it { should belong_to(:user) }
end
