require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_inclusion_of(:name).in_array(['good', 'bad']) }
  ##### Uncomment  after story model is added
  # it { should have_many(:stories) }
end
