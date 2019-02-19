class FollowersController < ApplicationController

  def follow_user
    @user = User.find_by! id: params[:id]
    if current_user.follow @user
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow_user
    @user = User.find_by! id: params[:id]
    if current_user.unfollow @user
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

end
