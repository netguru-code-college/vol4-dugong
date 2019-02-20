require 'rails_helper'
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation


RSpec.describe FollowersController, type: :controller do
  before do
    DatabaseCleaner.clean
    @adam = User.create!(email: "adam@wp.pl", password: "haslo123", username: "adam")
    @jurek = User.create!(email: "jurek@wp.pl", password: "haslo123", username: "jurek")
    sign_in(@adam)
  end

  describe "POST #follow_user" do
    subject { post :follow_user, params: { id: @adam.id, followable_type: 'User', followable_id: @jurek.id} }
    it "creates new follower" do
      expect { subject }.to change { Follower.count }.by(1)
      expect( Follower.count ).to eq 1
    end
  end

  # describe "POST #unfollow_user" do
  #   subject { post :unfollow_user, params: { id: @adam.id, followable_type: 'User', followable_id: @jurek.id} }
  #   before do
  #     Follower.create( user_id: @adam.id, followable_type: 'User', followable_id: @jurek.id )
  #   end
  #   it "returns http success" do
  #     expect( Follower.count ).to eq 1
  #     expect { subject }.to change { Follower.count }.by(-1)
  #   end
  # end


end
